//
//  AppDelegate.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        setup()
        
        return true
    }
}


// MARK: - AppDelegate + Setup
//
private extension AppDelegate {
    
    /// This is setup all setup and configure dependencies
    /// Now we can add any code of dependencies and app delegate not massive
    ///
    func setup() {
        
        /// ``` Check thid link if you wanna get more
        /// `` https://www.vadimbulavin.com/refactoring-massive-app-delegate/
        
        StartupCommandsBuilder()
            .setKeyWindow(window)
            .build()
            .forEach { $0.execute() }
        // Check printed values after run
    }
}
