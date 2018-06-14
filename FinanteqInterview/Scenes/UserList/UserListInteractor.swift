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
    func updateIndicatorState(response: UserListScene.UpdateIndicatorState.Response)
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

    fileprivate func updateIndicatorStateResponse(isHidden: Bool) {
        let response = UserListScene.UpdateIndicatorState.Response(isHidden: isHidden)
        output?.updateIndicatorState(response: response)
    }
}

// MARK: UserListViewControllerOutput

extension UserListInteractor: UserListViewControllerOutput {
    func fetchUsers(request: UserListScene.FetchUsers.Request) {
        updateIndicatorStateResponse(isHidden: false)
        userWorker.fetchUsers().then { fetchedUsers in
            self.users = fetchedUsers
            self.fetchUsersResponse(users: self.users)
        }.catch { error in
            //TODO handle error
        }.always {
            self.updateIndicatorStateResponse(isHidden: true)
        }
    }

    func selectUser(request: UserListScene.SelectUser.Request) {
        navigateToUserdetailsResponse(user: users[request.index])
    }
}
