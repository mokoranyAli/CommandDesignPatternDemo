//
//  MovieReceiver.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS OUR INVOKER IN COMMAND PATTERN```

// MARK: - MovieReceiver
//
/// Act as receiver to be used in command
///
struct MovieReceiver {
    
    // MARK: - Properties
    
    private let networkManager: Networkable = NetowkManager.shared
    
    /// Title for navigation in selection tableview
    ///
    var title: String =  "Movies List"
    
    /// Subtitle for navigation in selection tableview
    ///
    var subtitle: String? = "choose one movie or more"
          
    // MARK: - Handlers
    
    /// Load movies
    /// This is the `action` and it is `encapsulated`
    /// To be used in command and command delegate it to the invoker
    ///
    func loadMovies(onCompletion: @escaping ((Result<[Movie], Error>) -> Void)) {
        networkManager.loadData(url: Constants.url) { (response: MovieResponse?, error: Error?) in
            guard let response = response else {
                onCompletion(.failure(error ?? NoResultError()))
                return
            }
            onCompletion(.success(response.movies))
        }
    }
}

// MARK: - News Constants

private struct Constants {
    static let url: String = "https://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=f9fff5cdf61663858e62cf2282fbf0f2"
}

// MARK: - Movie + Command Model Conformance
//
extension Movie: Equatable, CommandRepresentable {
    
    public var displayValue: String {
        return title
    }
    
    public static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}
