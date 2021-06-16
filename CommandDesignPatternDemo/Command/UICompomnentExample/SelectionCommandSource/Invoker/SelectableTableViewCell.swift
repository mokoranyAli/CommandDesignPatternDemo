//
//  SelectableTableViewCell.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - SelectableTableViewCell
//
/// This is for using in selction tableview either single or multiple selections
///
class SelectableTableViewCell: UITableViewCell {
  
  // MARK: - Inits
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
  }
  
  required init?(coder aDecoder: NSCoder) {
    assertionFailure("Not implemented")
    return nil
  }
  
  // MARK: - Overriden methods
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    self.accessoryType = selected ? .checkmark : .none
  }
}
