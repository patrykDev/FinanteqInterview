//
//  UserDetailsInteractor.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserDetailsInteractorOutput {}

protocol UserDetailsDataSource {}

class UserDetailsInteractor: UserDetailsDataSource {
    var output: UserDetailsInteractorOutput?
}

// MARK: UserDetailsViewControllerOutput

extension UserDetailsInteractor: UserDetailsViewControllerOutput {}
