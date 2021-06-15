//
//  State.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

// MARK: - State
//
/// This is for lengthy opertaions
/// To indicate operations in loading, success of failure state
///
public enum State {
  
  /// A success, storing a `Success` value.
  ///
  case success
  
  /// A failure, storing a `Error` value.
  ///
  case failure(Error)
  
  /// A loading, indicates when loading starts
  ///
  case loading
}

// MARK: - Equatable
//
extension State: Equatable {
  
  public static func == (lhs: State, rhs: State) -> Bool {
    switch (lhs, rhs) {
    case (.success, .success):
      return true
    case (.failure, .failure):
      return true
    case (.loading, .loading):
      return true
    default:
      return false
    }
  }
}

// MARK: - Helpers
//
extension State {
  
  /// Error
  ///
  var error: Error? {
    if case .failure(let error) = self {
      return error
    }
    
    return nil
  }
}
