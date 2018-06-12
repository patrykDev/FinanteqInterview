//
//  UserListPresenter.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

protocol UserListPresenterOutput: class {}

class UserListPresenter {

    weak var output: UserListPresenterOutput?
}

// MARK: UserListInteractorOutput

extension UserListPresenter: UserListInteractorOutput {}
