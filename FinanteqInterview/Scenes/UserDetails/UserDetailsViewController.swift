//
//  UserDetailsViewController.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit

protocol UserDetailsViewControllerOutput {
    func setupView(request: UserDetailsScene.SetupView.Request)
}

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
        setupViewRequest()
    }

    // MARK: Requests

    fileprivate func setupViewRequest() {
        let request = UserDetailsScene.SetupView.Request()
        output?.setupView(request: request)
    }
}

// MARK: UserDetailsPresenterOutput

extension UserDetailsViewController: UserDetailsPresenterOutput {
    func setupView(viewModel: UserDetailsScene.SetupView.ViewModel) {
        userDetailsView?.configureView(viewModel: viewModel)
    }
}
