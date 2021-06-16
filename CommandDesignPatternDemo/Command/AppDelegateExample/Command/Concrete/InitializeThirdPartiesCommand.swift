//
//  InitializeThirdPartiesCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//


import Foundation

// MARK: - InitializeThirdPartiesCommand
//
/// This is for setup Third parties configurations
/// Like `FirebaseApp.configure()` for example
///
struct InitializeThirdPartiesCommand: Command {
    
    // MARK: - Public Handlers
    
    func execute() {
        setupFirebase()
    }
}

// MARK: - Private Handlers
//
private extension InitializeThirdPartiesCommand {
    
    /// Setup: Firebase
    ///
    func setupFirebase() {
        print("configure firebase ...")
    }
    
    // Do any configurations for third parties here ...
}
