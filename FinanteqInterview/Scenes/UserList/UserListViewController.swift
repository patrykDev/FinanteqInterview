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
    func selectUser(request: UserListScene.SelectUser.Request)
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
        userListView?.delegate = self
        title = NSLocalizedString("user_list_scene_title", comment: "")
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

    fileprivate func selectUserRequest(index: Int) {
        let request = UserListScene.SelectUser.Request(index: index)
        output?.selectUser(request: request)
    }
}

// MARK: UserListPresenterOutput

extension UserListViewController: UserListPresenterOutput {
    func fetchUsers(viewModel: UserListScene.FetchUsers.ViewModel) {
        userListView?.reload(users: viewModel.userListItems)
    }

    func navigateToUserDetails(viewModel: UserListScene.NavigateToUserDetails.ViewModel) {
        router?.navigateToUserDetails(user: viewModel.user)
    }

    func updateTableViewState(viewModel: UserListScene.UpdateTableViewState.ViewModel) {
        userListView?.setTableView(state: viewModel.state)
    }
}

// MARK: UserListViewDelegate

extension UserListViewController: UserListViewDelegate {
    func userListView(userListView: UserListView, didSelectItemAt index: Int) {
        selectUserRequest(index: index)
    }

    func userListViewDidTapTryAgainButton(userListView: UserListView) {
        fetchUsersRequest()
    }
}
