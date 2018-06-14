//
//  User.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

enum UserType {
    case dailyMotion
    case gitHub
}

protocol User {
    var username: String! { get set }
    var avatarUrl: String! { get set }
    var userType: UserType { get }
}

struct TemporraryUser: User {
    var username: String!
    var avatarUrl: String!
    let userType: UserType = .dailyMotion
}
