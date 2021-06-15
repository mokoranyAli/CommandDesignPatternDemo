//
//  UserReceiver.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

/// ``` THIS IS OUR INVOKER IN COMMAND PATTERN```

// MARK: - UserReceiver
//
/// Act as receiver to be used in command
///
struct UserReceiver {
    
    // MARK: - Properties
        
    /// Title for navigation in selection tableview
    ///
    var title: String =  "User List"
    
    /// Subtitle for navigation in selection tableview
    ///
    var subtitle: String? = nil
          
    // MARK: - Handlers
    
    /// Load news
    /// This is the `action` and it is `encapsulated`
    /// To be used in command and command delegate it to the invoker
    ///
    func loadNews(onCompletion: @escaping ((Result<[User], Error>) -> Void)) {
        onCompletion(.success([User(name: "Mohamed", age: "25"),
                               User(name: "Ahmed", age: "30"),
                               User(name: "Youssif", age: "18")]))
        }
    }

// MARK: - User + Command Model Conformance
//
extension User: Equatable, CommandRepresentable {
    
    public var displayValue: String {
        return name
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name &&
            lhs.age == rhs.age
    }
}
