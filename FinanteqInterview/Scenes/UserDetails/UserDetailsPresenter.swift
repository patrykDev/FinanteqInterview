//
//  UserDetailsPresenter.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserDetailsPresenterOutput: class {}

class UserDetailsPresenter {

    weak var output: UserDetailsPresenterOutput?
}

// MARK: UserDetailsInteractorOutput

extension UserDetailsPresenter: UserDetailsInteractorOutput {}
