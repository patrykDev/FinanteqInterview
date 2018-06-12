//
//  UITableView+Nib.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit

extension UITableView {

    func register(cellType: UITableViewCell.Type, reuseIdentifier: String) {
        guard let nib = Bundle.nib(for: cellType) else { return }
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
