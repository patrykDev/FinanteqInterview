//
//  UIView+Nib.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 12/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import UIKit

extension Bundle {

    public static func nibView<V: UIView>(for viewType: V.Type, owner: Any? = nil) -> V? {
        let bundle = Bundle(for: viewType)
        return UINib(nibName: String(describing: viewType), bundle: bundle).instantiate(withOwner: owner, options: nil).first as? V
    }

    public static func nib<V: UIView>(for viewType: V.Type, owner: Any? = nil) -> UINib? {
        let bundle = Bundle(for: viewType)
        return UINib(nibName: String(describing: viewType), bundle: bundle)
    }
}
