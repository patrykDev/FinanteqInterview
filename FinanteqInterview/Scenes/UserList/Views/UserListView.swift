//
//  UserListView.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit

class UserListView: UIView {

    @IBOutlet fileprivate var tableView: UITableView!

    fileprivate var items: [UserListItem] = []

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

    // MARK: Private helpers

    fileprivate func configureTableView() {
        tableView.register(cellType: UserListItemCell.self, reuseIdentifier: UserListItemCell.description())
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
        //TODO: handle selection
    }
}
