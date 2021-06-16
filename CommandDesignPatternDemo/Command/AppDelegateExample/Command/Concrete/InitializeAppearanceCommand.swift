//
//  InitializeAppearanceCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

// MARK: - InitializeAppearanceCommand
//
/// For Initialinzing common actions in UI
///
struct InitializeAppearanceCommand: Command {
    
    // MARK: - Public Handlers
    
    func execute() {
        setupComponentsAppearance()
    }
}

// MARK: - Private Handlers
//
private extension InitializeAppearanceCommand {
    
    /// Sets up all of the component(s) Appearance.
    ///
    func setupComponentsAppearance() {
        configureNavigationAppearance()
        configureSearchBarAppearance()
        setupSemanticAttributes()
    }
    
    func configureNavigationAppearance() {
        print("Configure navigation bar appearance")
    }
    
    func configureSearchBarAppearance() {
        print("Configure search bar appearance")
    }
    
    func setupSemanticAttributes() {
        print("Configure semantic attribute based on language")
    }
}
