//
//  UserListPresenter.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserListPresenterOutput: class {
    func fetchUsers(viewModel: UserListScene.FetchUsers.ViewModel)
    func navigateToUserDetails(viewModel: UserListScene.NavigateToUserDetails.ViewModel)
    func updateTableViewState(viewModel: UserListScene.UpdateTableViewState.ViewModel)
}

class UserListPresenter {

    weak var output: UserListPresenterOutput?
}

// MARK: UserListInteractorOutput

extension UserListPresenter: UserListInteractorOutput {
    func fetchUsers(response: UserListScene.FetchUsers.Response) {
        let items = response.userList.map { UserListItem(username: $0.username, avatarUrl: $0.avatarUrl, additionalInfo: $0.userType.userTypeString) }
        let viewModel = UserListScene.FetchUsers.ViewModel(userListItems: items)

        DispatchQueue.main.async { [weak self] in
            self?.output?.fetchUsers(viewModel: viewModel)
        }
    }

    func navigateToUserDetail(response: UserListScene.NavigateToUserDetails.Response) {
        let viewModel = UserListScene.NavigateToUserDetails.ViewModel(user: response.user)
        DispatchQueue.main.async { [weak self] in
            self?.output?.navigateToUserDetails(viewModel: viewModel)
        }
    }

    func updateTableViewState(response: UserListScene.UpdateTableViewState.Response) {
        let viewModel = UserListScene.UpdateTableViewState.ViewModel(state: response.state)
        DispatchQueue.main.async { [weak self] in
            self?.output?.updateTableViewState(viewModel: viewModel)
        }
    }
}
