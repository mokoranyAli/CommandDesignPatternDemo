//
//  SelectionCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS OUR Command IN COMMAND PATTERN```


/// This is for command element should have display value and hashable
/// Hashable because of we have a set of items in case of multiple selection
///
public typealias ValidCommandModel = CommandRepresentable & Equatable

// MARK: - SelectionCommand
//
public protocol SelectionCommand {
  
  /// Model Type
  ///
  associatedtype Model = ValidCommandModel
  
  /// Result Type
  ///
  typealias ResultType = Result<[Model], Error>
  
  /// Handler
  ///
  typealias Handler = (ResultType) -> Void
  
  /// Allow multiple selections
  ///  indicates if the tableview should select more than one items or not
  ///
  var allowsMultipleSelection: Bool { get }
  
  /// Indicates screen title
  ///
  var title: String { get }
  
  /// Indicates screen subtitle
  ///
  var subtitle: String? { get }
  
  /// Load Data; Should be called when the data is loaded
  ///
  func loadData(onCompletion: @escaping Handler)
}

// MARK: - SelectionCommand + Default implementation
//
extension SelectionCommand {
  
  /// TitleView subtitle
  ///
  var subtitle: String? {
    return allowsMultipleSelection ? Constants.subtitle : nil
  }
}

private enum Constants {
  static var subtitle: String { "Select one or more" }
}
