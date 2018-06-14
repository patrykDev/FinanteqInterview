//
//  APIService.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 14/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import Hydra

class APIService<APIType: TargetType> {

    let moyaProvider = MoyaProvider<APIType>()

    func executeRequest(request: APIType) -> Promise<JSON> {
        return Promise { resolved, rejected, _ in
            self.moyaProvider.request(request) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        let response = try JSON(data: moyaResponse.data)
                        resolved(response)
                    } catch {
                        rejected(error)
                    }
                case .failure(let error):
                    rejected(error)
                }
            }
        }
    }
}
