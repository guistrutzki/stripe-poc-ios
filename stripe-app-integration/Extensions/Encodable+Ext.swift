//
//  Encodable+Ext.swift
//  stripe-app-integration
//
//  Created by Guilherme Strutzki on 31/05/22.
//

import Foundation

extension Encodable {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
