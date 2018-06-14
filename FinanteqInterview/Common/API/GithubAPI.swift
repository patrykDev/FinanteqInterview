//
//  GithubAPI.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 14/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation
import Moya

enum GithubAPI {
    case users
}

extension GithubAPI: TargetType {

    var baseURL: URL { return URL(string: "https://api.github.com")! }

    var path: String {
        switch self {
        case .users:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .users:
            return .get
        }
    }

    var sampleData: Data { return Data() }

    var task: Task { return .requestPlain }

    var validationType: ValidationType { return .successCodes }

    var headers: [String: String]? { return nil }
}
