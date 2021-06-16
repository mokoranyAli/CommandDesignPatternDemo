//
//  Command.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

/// Command for doing diffrent actions
/// We use it to seperate`AppDelegate` logic and dependenies
/// Could use it anywhere as long as we need abstract action to do diffrenet actions
///
protocol Command {
  
  /// Execute the concrete command action
  ///
  func execute()
}

