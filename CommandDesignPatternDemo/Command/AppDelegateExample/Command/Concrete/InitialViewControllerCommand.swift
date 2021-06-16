//
//  InitialViewControllerCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - InitialViewControllerCommand
//
struct InitialViewControllerCommand: Command {
    
    // MARK: - Properties
    
    /// App Window
    ///
    let keyWindow: UIWindow
    
    // MARK: - Public Handlers
    
    func execute() {
        keyWindow.rootViewController = StartViewController()
        keyWindow.makeKeyAndVisible()
    }
}
