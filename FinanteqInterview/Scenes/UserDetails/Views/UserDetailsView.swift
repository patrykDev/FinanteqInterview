//
//  UserDetailsView.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailsView: UIView {

    @IBOutlet fileprivate var avatarImageView: UIImageView!

    func configureView(avatarUrl: String, username: String) {
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(with: URL(string: avatarUrl))
    }
}
