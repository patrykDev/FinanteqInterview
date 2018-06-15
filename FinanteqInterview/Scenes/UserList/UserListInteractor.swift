//
//  UserListInteractor.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserListInteractorOutput {
    func fetchUsers(response: UserListScene.FetchUsers.Response)
    func navigateToUserDetail(response: UserListScene.NavigateToUserDetails.Response)
    func updateTableViewState(response: UserListScene.UpdateTableViewState.Response)
}

protocol UserListDataSource {}

class UserListInteractor: UserListDataSource {
    var output: UserListInteractorOutput?

    fileprivate let userWorker = UserWorker()
    fileprivate var users: [User] = []

    //MARK: Responses

    fileprivate func fetchUsersResponse(users: [User]) {
        let response = UserListScene.FetchUsers.Response(userList: users)
        output?.fetchUsers(response: response)
    }

    fileprivate func navigateToUserdetailsResponse(user: User) {
        let response = UserListScene.NavigateToUserDetails.Response(user: user)
        output?.navigateToUserDetail(response: response)
    }

    fileprivate func updateTableViewStateResponse(state: HGTableViewState) {
        let response = UserListScene.UpdateTableViewState.Response(state: state)
        output?.updateTableViewState(response: response)
    }
}

// MARK: UserListViewControllerOutput

extension UserListInteractor: UserListViewControllerOutput {
    func fetchUsers(request: UserListScene.FetchUsers.Request) {
        updateTableViewStateResponse(state: .loading)
        userWorker.fetchUsers().then { fetchedUsers in
            self.users = fetchedUsers
            self.fetchUsersResponse(users: self.users)
            let tableState: HGTableViewState = self.users.isEmpty ? .empty : .content
            self.updateTableViewStateResponse(state: tableState)
        }.catch { error in
            self.updateTableViewStateResponse(state: .error)
        }
    }

    func selectUser(request: UserListScene.SelectUser.Request) {
        navigateToUserdetailsResponse(user: users[request.index])
    }
}
