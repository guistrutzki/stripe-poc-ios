//
//  UITableViewCell+Ext.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import UIKit

extension UITableViewCell {

    class func classIdentifier() -> String {
        guard let className = String(describing: self)
                .components(separatedBy: ".")
                .last
        else {
            return ""
        }

        return className
    }
}
