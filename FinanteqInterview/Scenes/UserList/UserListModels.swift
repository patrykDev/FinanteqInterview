//
//  UserListModels.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

struct UserListScene {

    struct FetchUsers {
        struct Request {}

        struct Response {
            let userList: [User]
        }

        struct ViewModel {
            let userListItems: [UserListItem]
        }
    }

    struct SelectUser {
        struct Request {
            let index: Int
        }
    }

    struct NavigateToUserDetails {
        struct Response {
            let user: User
        }

        struct ViewModel {
            let user: User
        }
    }

    struct UpdateIndicatorState {
        struct Response {
            let isHidden: Bool
        }

        struct ViewModel {
            let isHidden: Bool
        }
    }
}
