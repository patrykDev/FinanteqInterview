//
//  UserDetailsPresenter.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserDetailsPresenterOutput: class {
    func setupView(viewModel: UserDetailsScene.SetupView.ViewModel)
}

class UserDetailsPresenter {

    weak var output: UserDetailsPresenterOutput?
}

// MARK: UserDetailsInteractorOutput

extension UserDetailsPresenter: UserDetailsInteractorOutput {
    func setupView(response: UserDetailsScene.SetupView.Response) {
        let viewModel = UserDetailsScene.SetupView.ViewModel(username: response.user.username, userType: response.user.userType.userTypeString, avatarUrl: response.user.avatarUrl)
        DispatchQueue.main.async { [weak self] in
            self?.output?.setupView(viewModel: viewModel)
        }
    }
}
