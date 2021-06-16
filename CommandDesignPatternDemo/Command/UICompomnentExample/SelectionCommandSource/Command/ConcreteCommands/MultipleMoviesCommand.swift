//
//  MultipleMoviesCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS ONE OF CONCRETE Command IN COMMAND PATTERN```

// MARK: - MultipleMoviesCommand
//
struct MultipleMoviesCommand: SelectionCommand {
    
    // MARK: - Typealiases
    
    typealias Model = Movie
    
    // MARK: - Properties
    
    /// Navigation view title based on `Receiver` title
    ///
    let title: String
    
    /// Navigation view subtitle based on `Receiver` title
    ///
    let subtitle: String?
    
    /// This is the action and the `Receiver`  in UML
    ///
    let action: MovieReceiver
    
    /// For tableview selection either single or multiple
    ///
    let allowsMultipleSelection: Bool = true
    
    // MARK: - Init
    
    init(action: MovieReceiver = MovieReceiver()) {
        self.action = action
        self.title = action.title
        self.subtitle = action.subtitle
    }
    
    // MARK: - Handlers
    
    func loadData(onCompletion: @escaping Handler) {
        action.loadMovies(onCompletion: onCompletion)
    }
}
