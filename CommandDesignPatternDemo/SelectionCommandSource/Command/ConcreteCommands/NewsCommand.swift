//
//  NewsCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS ONE OF CONCRETE Command IN COMMAND PATTERN```

// MARK: - SingleNewsCommand
//
struct SingleNewsCommand: SelectionCommand {
    
    // MARK: - Typealiases
    
    typealias Model = News
    
    // MARK: - Properties
    
    /// Navigation view title based on `Receiver` title
    ///
    let title: String
    
    /// Navigation view subtitle based on `Receiver` title
    ///
    let subtitle: String?
    
    /// This is the action and the `Receiver`  in UML
    ///
    let newsAction: NewsReceiver
    
    /// For tableview selection either single or multiple
    ///
    let allowsMultipleSelection: Bool = false
    
    init(action: NewsReceiver = NewsReceiver()) {
        self.newsAction = action
        self.title = action.title
        self.subtitle = action.subtitle
    }
    
    // MARK: - Handlers
    
    func loadData(onCompletion: @escaping Handler) {
        newsAction.loadNews(onCompletion: onCompletion)
    }
}

