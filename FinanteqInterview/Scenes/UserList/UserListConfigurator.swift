//
//  UserListConfigurator.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

// MARK: Connect View, Interactor, and Presenter

extension UserListInteractor: UserListRouterDataSource {}

class UserListConfigurator {

    static let sharedInstance = UserListConfigurator()

    private init() {}

    // MARK: Configuration

    func configure(viewController: UserListViewController) {

        let presenter = UserListPresenter()
        presenter.output = viewController

        let interactor = UserListInteractor()
        interactor.output = presenter

        let router = UserListRouter(viewController: viewController, dataSource: interactor)

        viewController.output = interactor
        viewController.router = router
    }
}
