//
//  UserListInteractor.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserListInteractorOutput {}

protocol UserListDataSource {}

class UserListInteractor: UserListDataSource {
    var output: UserListInteractorOutput?
}

// MARK: UserListViewControllerOutput

extension UserListInteractor: UserListViewControllerOutput {}
