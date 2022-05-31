//
//  ViewCode.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 30/05/22.
//

import UIKit
import SnapKit

protocol ViewCode where Self: UIView {
    func configureSubviews()
    func configureSubviewsConstraints()
    func configureAdditionalBehaviors()
}

extension ViewCode {
    public func setupViews() {
        configureSubviews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
}
