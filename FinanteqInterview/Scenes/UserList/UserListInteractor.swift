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
}

// MARK: UserListViewControllerOutput

extension UserListInteractor: UserListViewControllerOutput {
    func fetchUsers(request: UserListScene.FetchUsers.Request) {
        //TODO: show indicator
        userWorker.fetchUsers().then { fetchedUsers in
            self.users = fetchedUsers
            self.fetchUsersResponse(users: self.users)
        }.catch { error in
            //TODO handle error
        }.always {
            //TODO: hide indicator
        }
    }
}
