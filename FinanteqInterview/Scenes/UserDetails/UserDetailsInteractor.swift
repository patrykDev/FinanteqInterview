//
//  UserDetailsInteractor.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserDetailsInteractorOutput {
    func setupView(response: UserDetailsScene.SetupView.Response)
}

protocol UserDetailsDataSource {
    var currentUser: User! { get set }
}

class UserDetailsInteractor: UserDetailsDataSource {
    var output: UserDetailsInteractorOutput?
    var currentUser: User!

    // MARK: Responses

    fileprivate func setupViewResponse(user: User) {
        let response = UserDetailsScene.SetupView.Response(user: user)
        output?.setupView(response: response)
    }
}

// MARK: UserDetailsViewControllerOutput

extension UserDetailsInteractor: UserDetailsViewControllerOutput {
    func setupView(request: UserDetailsScene.SetupView.Request) {
        setupViewResponse(user: currentUser)
    }
}
