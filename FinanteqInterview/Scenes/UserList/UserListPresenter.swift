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
    func updateIndicatorState(viewModel: UserListScene.UpdateIndicatorState.ViewModel)
}

class UserListPresenter {

    weak var output: UserListPresenterOutput?

    // MARK: Private helpers

    fileprivate func additionalInfo(from userType: UserType) -> String {
        switch userType {
        case .dailyMotion:
            return NSLocalizedString("user_type_daily_motion", comment: "")
        case .gitHub:
            return NSLocalizedString("user_type_git_hub", comment: "")
        }
    }
}

// MARK: UserListInteractorOutput

extension UserListPresenter: UserListInteractorOutput {
    func fetchUsers(response: UserListScene.FetchUsers.Response) {
        let items = response.userList.map { UserListItem(username: $0.username, avatarUrl: $0.avatarUrl, additionalInfo: additionalInfo(from: $0.userType)) }
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

    func updateIndicatorState(response: UserListScene.UpdateIndicatorState.Response) {
        let viewModel = UserListScene.UpdateIndicatorState.ViewModel(isHidden: response.isHidden)
        DispatchQueue.main.async { [weak self] in
            self?.output?.updateIndicatorState(viewModel: viewModel)
        }
    }
}
