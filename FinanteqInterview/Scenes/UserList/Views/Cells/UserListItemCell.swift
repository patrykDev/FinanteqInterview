//
//  UserListItemCell.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit
import Kingfisher

struct UserListItem {
    let username: String
    let avatarUrl: String
    let additionalInfo: String
}

class UserListItemCell: UITableViewCell {

    @IBOutlet fileprivate var nameLabel: UILabel!
    @IBOutlet fileprivate var descriptionLabel: UILabel!
    @IBOutlet fileprivate var avatarImageView: UIImageView!

    func configure(with item: UserListItem) {
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(with: URL(string: item.avatarUrl))

        nameLabel.text = item.username
        descriptionLabel.text = item.additionalInfo
    }
}
