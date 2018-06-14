//
//  UserWorker.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation
import Moya
import Hydra

class UserWorker {

    // MARK: Interface

    func fetchUsers() -> Promise<[User]> {
        return Promise { resolved, rejected, _ in
            var users: [User] = []
            self.fetchGithubUsers().then { githubUsers in
                users += githubUsers
                self.fetchDailyMotionUsers().then { dailyMotionUsers in
                    users += dailyMotionUsers
                    resolved(users)
                }.catch { error in
                    rejected(error)
                }
            }.catch { error in
                rejected(error)
            }
        }
    }

    // MARK: Private helpers

    fileprivate func fetchGithubUsers() -> Promise<[User]> {
        return Promise { resolved, rejected, _ in
            let apiService = APIService<GithubAPI>()
            apiService.executeRequest(request: .users).then { json in
                let users = json.arrayValue.compactMap { $0.dictionaryObject }.compactMap { try? GithubUserDTO(JSON: $0) }
                resolved(users)
            }.catch { error in
                rejected(error)
            }
        }
    }

    fileprivate func fetchDailyMotionUsers() -> Promise<[User]> {
        return Promise { resolved, rejected, _ in
            let apiService = APIService<DailyMotionAPI>()
            apiService.executeRequest(request: .users(["avatar_360_url","username"])).then { json in
                let users = json["list"].arrayValue.compactMap { $0.dictionaryObject }.compactMap { try? DailyMotionUserDTO(JSON: $0) }
                resolved(users)
            }.catch { error in
                rejected(error)
            }
        }
    }
}
