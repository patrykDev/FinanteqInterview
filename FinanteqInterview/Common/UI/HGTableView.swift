//
//  HGTableView.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 15/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit
import HGPlaceholders

enum HGTableViewState {
    case loading
    case error
    case content
    case empty
}

class HGTableView: TableView {

    override func customSetup() {
        placeholdersProvider = .default2
    }
}
