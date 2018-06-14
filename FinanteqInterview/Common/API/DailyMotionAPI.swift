//
//  DailyMotionAPI.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 14/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation
import Moya

enum DailyMotionAPI {
    case users([String])
}

extension DailyMotionAPI: TargetType {

    var baseURL: URL { return URL(string: "https://api.dailymotion.com")! }

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

    var task: Task {
        switch self {
        case .users(let fields):
            let fieldsString = fields.joined(separator: ",")
            return .requestParameters(parameters: ["fields": fieldsString], encoding: URLEncoding.queryString)
        }
    }

    var validationType: ValidationType { return .successCodes }

    var headers: [String: String]? { return nil }
}
