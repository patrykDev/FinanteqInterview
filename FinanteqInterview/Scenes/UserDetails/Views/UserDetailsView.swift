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
    @IBOutlet fileprivate var usernameLabel: UILabel!
    @IBOutlet fileprivate var userTypeLabel: UILabel!

    @IBOutlet fileprivate var usernameTitleLabel: UILabel!
    @IBOutlet fileprivate var userTypeTitleLabel: UILabel!

    // MARK: UIView life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    // MARK: Interface

    func configureView(viewModel: UserDetailsScene.SetupView.ViewModel) {
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(with: URL(string: viewModel.avatarUrl))

        usernameLabel.text = viewModel.username
        userTypeLabel.text = viewModel.userType
    }

    // MARK: Private helpers

    private func setupView() {
        usernameTitleLabel.text = NSLocalizedString("user_details_username_title", comment: "")
        userTypeTitleLabel.text = NSLocalizedString("user_details_user_type_title", comment: "")
    }
}
