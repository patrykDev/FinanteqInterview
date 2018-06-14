//
//  UIViewController+Indicator.swift
//  FinanteqInterview
//
//  Created by Patryk Domagala on 14/06/2018.
//  Copyright © 2018 Dom-Pat. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension UIViewController {
    func showIndicator() {
        let activityData = ActivityData(size: nil,
                                        message: nil,
                                        messageFont: nil,
                                        type: NVActivityIndicatorType.ballGridPulse,
                                        color: nil,
                                        padding: nil,
                                        displayTimeThreshold: nil,
                                        minimumDisplayTime: nil,
                                        backgroundColor: nil,
                                        textColor: nil)
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        }
    }

    func hideIndicator() {
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }
}
