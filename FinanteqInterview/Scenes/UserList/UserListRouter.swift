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
    weak private var dataSource: UserListRouterDataSource!

    init(viewController: UserListViewController, dataSource: UserListRouterDataSource) {
        self.viewController = viewController
        self.dataSource = dataSource
    }

    // MARK: Navigation

    func navigateToUserDetails() {
        //TODO: Implement Navigation
    }
}
