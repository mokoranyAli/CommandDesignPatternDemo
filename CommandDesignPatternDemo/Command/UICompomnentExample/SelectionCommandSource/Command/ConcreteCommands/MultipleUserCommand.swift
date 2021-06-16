//
//  MultipleUserCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS ONE OF CONCRETE Command IN COMMAND PATTERN```

// MARK: - MultipleUserCommand
//
struct MultipleUserCommand: SelectionCommand {
    
    // MARK: - Typealiases
    
    typealias Model = User
    
    // MARK: - Properties
    
    /// Navigation view title based on `Receiver` title
    ///
    let title: String
    
    /// Navigation view subtitle based on `Receiver` title
    ///
    let subtitle: String?
    
    /// This is the action and the `Receiver`  in UML
    ///
    let action: UserReceiver
    
    /// For tableview selection either single or multiple
    ///
    let allowsMultipleSelection: Bool = true
    
    init(action: UserReceiver = UserReceiver()) {
        self.action = action
        self.title = action.title
        self.subtitle = action.subtitle
    }
    
    // MARK: - Handlers
    
    func loadData(onCompletion: @escaping Handler) {
        action.loadNews(onCompletion: onCompletion)
    }
}
