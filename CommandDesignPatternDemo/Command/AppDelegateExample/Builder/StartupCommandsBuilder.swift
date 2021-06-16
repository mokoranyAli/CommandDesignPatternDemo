//
//  StartupCommandsBuilder.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - StartupCommandsBuilder
//
/// This is builder for giving us a different types of actions to be implemented in `AppDelegate`
///  This is because ``we don't need to avoid SRP (Single Responsibility Principle) ``
///  And reduce code in AppDelegate
///
/// - Example
/// ```
///  StartupCommandsBuilder()
///   .setKeyWindow(window)
///   .build()
///   .forEach { $0.execute() }
/// ```
///
final class StartupCommandsBuilder {
    
    // MARK: - Properties
    
    /// App window
    /// Should be appDelegate's window
    ///
    private var window: UIWindow?
    
    // MARK: - Handlers
    
    /// This is because setup window on screen
    /// - Parameter window: Should be appDelegate window
    /// - Returns: Self to continue building process and this is how Builder Pattern work
    ///
    func setKeyWindow(_ window: UIWindow?) -> StartupCommandsBuilder {
        self.window = window
        return self
    }
    
    /// Get all commands to execute
    ///
    func build() -> [Command] {
        guard let window = window else {
            fatalError("There is no window")
        }
        return [
            InitializeThirdPartiesCommand(),
            RegisterToRemoteNotificationsCommand(),
            InitializeAppearanceCommand(),
            InitialViewControllerCommand(keyWindow: window),
        ]
    }
}
