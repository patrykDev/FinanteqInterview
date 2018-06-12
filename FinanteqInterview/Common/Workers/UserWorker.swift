//
//  UserWorker.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation

class UserWorker {

    // MARK: Interface

    func mockedUsers() -> [TemporraryUser] {
        let sampleUser = TemporraryUser(username: "Stachu", avatarUrl: "https://avatars0.githubusercontent.com/u/1?v=4")
        return [sampleUser, sampleUser, sampleUser]
    }
}
