//
//  Optional+Helpers.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

// MARK: - Optional + Collections
//
extension Optional where Wrapped: Collection {
    
    /// Checks whether the wrapped value is nil or empty
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
