//
//  UserDetailsRouter.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserDetailsRouterDataSource: class {
    var currentUser: User! { get set }
}

class UserDetailsRouter {

    weak var viewController: UserDetailsViewController!
    weak var dataSource: UserDetailsRouterDataSource!

    init(viewController: UserDetailsViewController, dataSource: UserDetailsRouterDataSource) {
        self.viewController = viewController
        self.dataSource = dataSource
    }
}
