//
//  ActivityIndicator.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - ActivityIndicator
//
/// Wrapper for UIActivityIndicatorView to handle logic internally
///
class ActivityIndicator: UIActivityIndicatorView {
  
  // MARK: - Init
  
  init() {
    super.init(style: .medium)
    configureView()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - View's Configuration
//
private extension ActivityIndicator {
  
  /// Setup defaults properties in indicator
  ///
  func configureView() {
    hidesWhenStopped = true
  }
  
  /// Add the IndicatorView in the center of viewcontroller's view
  ///
  func configureConstraints(parentView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
      centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
    constraints.forEach { $0.priority = .defaultHigh }
  }
}

// MARK: - Public Handlers
//
extension ActivityIndicator {
  
  /// Insert UIActivityIndicatorView to parent view controller
  ///
  func addToParentView(_ parentView: UIView) {
    parentView.addSubview(self)
    configureConstraints(parentView: parentView)
  }
}
