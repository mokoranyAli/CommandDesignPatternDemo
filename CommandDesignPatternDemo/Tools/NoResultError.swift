//
//  NoResultError.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

// MARK: - NoResultError
//
struct NoResultError: LocalizedError {
  
  public var errorDescription: String? {
    return "Something wrong happend!"
  }
}
