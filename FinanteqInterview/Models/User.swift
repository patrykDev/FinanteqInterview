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

    var userTypeString: String {
        switch self {
        case .dailyMotion:
            return NSLocalizedString("user_type_daily_motion", comment: "")
        case .gitHub:
            return NSLocalizedString("user_type_git_hub", comment: "")
        }
    }
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
