//
//  UserListView.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit
import HGPlaceholders

protocol UserListViewDelegate: class {
    func userListView(userListView: UserListView, didSelectItemAt index: Int)
    func userListViewDidTapTryAgainButton(userListView: UserListView)
}

class UserListView: UIView {

    @IBOutlet fileprivate var tableView: HGTableView!

    fileprivate var items: [UserListItem] = []

    weak var delegate: UserListViewDelegate?

    // MARK: UIView life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }

    // MARK: Interface

    func reload(users: [UserListItem]) {
        items = users
        tableView.reloadData()
    }

    func setTableView(state: HGTableViewState) {
        switch state {
        case .loading:
            tableView.showLoadingPlaceholder()
        case .error:
            tableView.showErrorPlaceholder()
        case .content:
            tableView.showDefault()
        case .empty:
            tableView.showNoResultsPlaceholder()
        }
    }

    // MARK: Private helpers

    fileprivate func configureTableView() {
        tableView.register(cellType: UserListItemCell.self, reuseIdentifier: UserListItemCell.description())
        tableView.placeholderDelegate = self
    }
}

// MARK: UITableViewDataSource

extension UserListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListItemCell.description()) as? UserListItemCell else { return UITableViewCell() }
        cell.configure(with: items[indexPath.row])

        return cell
    }
}

// MARK: UITableViewDelegate

extension UserListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userListView(userListView: self, didSelectItemAt: indexPath.row)
    }
}

extension UserListView: PlaceholderDelegate {
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder) {
        if placeholder.key == .loadingKey {
            tableView.showNoResultsPlaceholder()
        } else {
            delegate?.userListViewDidTapTryAgainButton(userListView: self)
        }
    }
}
