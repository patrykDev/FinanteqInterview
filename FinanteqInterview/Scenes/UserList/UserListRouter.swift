//
//  UserListRouter.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserListRouterDataSource: class {}

class UserListRouter {

    weak var viewController: UserListViewController!
    weak var dataSource: UserListRouterDataSource!

    init(viewController: UserListViewController, dataSource: UserListRouterDataSource) {
        self.viewController = viewController
        self.dataSource = dataSource
    }

    // MARK: Navigation

    func navigateToUserDetails(user: User) {
        let userDetailsViewController = UserDetailsViewController()
        userDetailsViewController.router?.dataSource.currentUser = user
        viewController.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}
