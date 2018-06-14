//
//  DailyMotionUserDTO.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 14/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation
import ObjectMapper

private struct UserKeyPath {
    static let username = "username"
    static let avatarUrl = "avatar_360_url"
}

struct DailyMotionUserDTO: ImmutableMappable, User {

    var username: String!
    var avatarUrl: String!
    let userType: UserType = .dailyMotion

    init(map: Map) throws {
        username = try map.value(UserKeyPath.username)
        avatarUrl = try map.value(UserKeyPath.avatarUrl)
    }

    mutating func mapping(map: Map) {
        username <- map[UserKeyPath.username]
        avatarUrl <- map[UserKeyPath.avatarUrl]
    }
}
