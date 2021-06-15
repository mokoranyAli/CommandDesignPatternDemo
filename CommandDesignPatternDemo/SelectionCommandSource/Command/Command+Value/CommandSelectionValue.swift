//
//  CommandSelectionValue.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

// MARK: - Selection Value
//
/// To be used when select item from the UI Component
///
public enum SelectionValue<T: ValidCommandModel>: Equatable {
  
  /// Indicates value in case of single selection
  ///
  case single(value: T)
  
  /// Indicates values in case multiple selection
  ///
  case multiple(values: [T])
}

// MARK: - Selection Value + Helpers
//
extension SelectionValue {
 
  /// Value should display in  Cell
  ///
  public var displayValue: String? {
    switch self {
    case .single(let value):
      return value.displayValue
      
    case .multiple(let values):
      return values.compactMap { $0.displayValue }.joined(separator: " - ")
    }
  }
  
  /// Value in case of single selction
  ///
  var singleValue: T? {
    if case .single(let value) = self {
      return value
    }

    return nil
  }
  
  /// Values in case of multple selction
  ///
  var listValue: [T]? {
    if case .multiple(let values) = self {
      return Array(values)
    }

    return nil
  }
}
