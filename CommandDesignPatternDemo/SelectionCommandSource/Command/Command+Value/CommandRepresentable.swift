//
//  CommandRepresentable.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

// MARK: - CommandRepresentable
//
/// This to serve on tableview cell
///
public protocol CommandRepresentable {
    
    /// Display value indicates something in the object to display on tabeview cell
    ///
    var displayValue: String { get }
}
