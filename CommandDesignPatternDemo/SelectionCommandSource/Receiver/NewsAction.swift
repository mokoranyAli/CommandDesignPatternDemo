//
//  NewsAction.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS OUR INVOKER IN COMMAND PATTERN```

// MARK: - NewsReceiver
//
/// Act as receiver to be used in command
///
struct NewsReceiver {
    
    // MARK: - Properties
    
    private let networkManager: Networkable = NetowkManager.shared
    
    /// Title for navigation in selection tableview
    ///
    var title: String =  "News List"
    
    /// Subtitle for navigation in selection tableview
    ///
    var subtitle: String? = nil
          
    // MARK: - Handlers
    
    /// Load news
    /// This is the `action` and it is `encapsulated`
    /// To be used in command and command delegate it to the invoker
    ///
    func loadNews(onCompletion: @escaping ((Result<[News], Error>) -> Void)) {
        networkManager.loadData(url: Constants.url) { (news: NewsResponse?, error: Error?) in
            guard let response = news, let articles = response.articles else {
                onCompletion(.failure(error ?? NoResultError()))
                return
            }
            onCompletion(.success(articles))
        }
    }
}

// MARK: - News Constants

private struct Constants {
    static let url: String = "https://newsapi.org/v2/top-headlines?apiKey=1943ddc16dc14f2e9e76374a493254c8&category%5B%5D=Science&country=eg&q=&sortBy=publishedAt"
}

// MARK: - News + Command Model Conformance
//
extension News: Equatable, CommandRepresentable {
    
    public var displayValue: String {
        return title ?? "No title found"
    }
    
    public static func == (lhs: News, rhs: News) -> Bool {
        return lhs.url == rhs.url
    }
}
