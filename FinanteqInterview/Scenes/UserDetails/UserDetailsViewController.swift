//
//  UserDetailsViewController.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit

protocol UserDetailsViewControllerOutput {}

class UserDetailsViewController: UIViewController {

    fileprivate let userDetailsView = Bundle.nibView(for: UserDetailsView.self)

    var output: UserDetailsViewControllerOutput?
    var router: UserDetailsRouter?

    // MARK: Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        UserDetailsConfigurator.sharedInstance.configure(viewController: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UserDetailsConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: UIViewController lifecycle

    override func loadView() {
        view = userDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Configure view
        userDetailsView?.configureView(avatarUrl: router?.dataSource.currentUser.avatarUrl ?? "", username: "Jasio")
    }
}

// MARK: UserDetailsPresenterOutput

extension UserDetailsViewController: UserDetailsPresenterOutput {}
