//
//  UserDetailsInteractor.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserDetailsInteractorOutput {}

protocol UserDetailsDataSource {
    var currentUser: User! { get set }
}

class UserDetailsInteractor: UserDetailsDataSource {
    var output: UserDetailsInteractorOutput?
    var currentUser: User!
}

// MARK: UserDetailsViewControllerOutput

extension UserDetailsInteractor: UserDetailsViewControllerOutput {}
