//
//  NavigationTitleView.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - NavigationTitleView
//
/// For navigations title view
/// It contains title label and sub title label
///
class NavigationTitleView: UIView {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var subTitleLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commitInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    commitInit()
  }
}

// MARK: - ConfigureView
//
private extension NavigationTitleView {
  
  func commitInit() {
    Bundle.main.loadNibNamed("\(NavigationTitleView.self)", owner: self, options: nil)
    contentView.addAndFixInView(self)
  }
}

// MARK: - Computed Properties
//
extension NavigationTitleView {
  
  /// Title
  var title: String? {
    get {
      titleLabel.text
    }
    set {
      titleLabel.text = newValue
      titleLabel.isHidden = newValue.isNilOrEmpty
    }
  }
  
  /// Subtitle
  ///
  var subtitle: String? {
    get {
      subTitleLabel.text
    }
    set {
      subTitleLabel.text = newValue
      subTitleLabel.isHidden = newValue.isNilOrEmpty
    }
  }
}
