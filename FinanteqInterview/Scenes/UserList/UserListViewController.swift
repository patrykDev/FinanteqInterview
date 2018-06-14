//
//  UserListViewController.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit

protocol UserListViewControllerOutput {
    func fetchUsers(request: UserListScene.FetchUsers.Request)
}

class UserListViewController: UIViewController {

    fileprivate let userListView = Bundle.nibView(for: UserListView.self)

    var output: UserListViewControllerOutput?
    var router: UserListRouter?

    // MARK: Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        UserListConfigurator.sharedInstance.configure(viewController: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UserListConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: UIViewController lifecycle

    override func loadView() {
        view = userListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsersRequest()
    }

    // MARK: Requests

    fileprivate func fetchUsersRequest() {
        let request = UserListScene.FetchUsers.Request()
        output?.fetchUsers(request: request)
    }
}

// MARK: UserListPresenterOutput

extension UserListViewController: UserListPresenterOutput {
    func fetchUsers(viewModel: UserListScene.FetchUsers.ViewModel) {
        userListView?.reload(users: viewModel.userListItems)
    }
}
