//
//  UserDetailsModels.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

struct UserDetailsScene {
    struct SetupView {
        struct Request {}

        struct Response {
            let user: User
        }

        struct ViewModel {
            let username: String
            let userType: String
            let avatarUrl: String
        }
    }
}
