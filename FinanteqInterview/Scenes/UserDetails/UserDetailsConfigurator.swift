//
//  UserDetailsConfigurator.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

// MARK: Connect View, Interactor, and Presenter

extension UserDetailsInteractor: UserDetailsRouterDataSource {}

class UserDetailsConfigurator {

    static let sharedInstance = UserDetailsConfigurator()

    private init() {}

    // MARK: Configuration

    func configure(viewController: UserDetailsViewController) {

        let presenter = UserDetailsPresenter()
        presenter.output = viewController

        let interactor = UserDetailsInteractor()
        interactor.output = presenter

        let router = UserDetailsRouter(viewController: viewController, dataSource: interactor)

        viewController.output = interactor
        viewController.router = router
    }
}
