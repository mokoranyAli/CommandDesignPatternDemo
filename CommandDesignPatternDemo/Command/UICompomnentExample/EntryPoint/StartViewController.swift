//
//  StartViewController.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

/// ``` NOTE```
/// YOU CAN IMPLEMENT ANY NUMBER OF COMMANDS WITH LIST LIKE `USER` OR FROM REMOTE LIKE `NEWS`
/// AND ALSO CAN DO IT WITH `SINGLE SELECTION`OR `MULTIPLE SELECTION`
///

import UIKit

// MARK: - StartViewController
//
class StartViewController: UIViewController {
    
    // MARK: - Outlets
    //
    @IBOutlet weak var selectionLabel: UILabel!
}

// MARK: - IBACtions
//
private extension StartViewController {
    
    @IBAction func startButtonTapped(_ sender: Any) {
        let viewController = UINavigationController(rootViewController:
            
            // Change any of Selection cotroller or add one
            /// For example `remove getMovieSelectionController() `
            /// And  `add getMovieSelectionController()`
            getMovieSelectionController())
        
        present(viewController, animated: true)
    }
}

// MARK: - Private Handler
//
private extension StartViewController {
    
    // MARK: - Selection Controllers
    
    /// Given Single News Selection
    ///
    func getNewsSelectionController() -> SelectionViewController<SingleNewsCommand> {
        let selectionViewController = SelectionViewController(command: SingleNewsCommand(), onEndEditing: didReceiveNewsResult)
        selectionViewController.onDismissCallback = {
            $0.dismiss(animated: true, completion: nil)
        }
        return selectionViewController
    }
    
    /// Given Mutliple User Selection
    ///
    func getUsersSelectionController() -> SelectionViewController<MultipleUserCommand> {
        let selectionViewController = SelectionViewController(command: MultipleUserCommand(), onEndEditing: didReceiveUserResult)
        selectionViewController.onDismissCallback = {
            $0.dismiss(animated: true, completion: nil)
        }
        return selectionViewController
    }
    
    /// Given Mutliple User Selection
       ///
       func getMovieSelectionController() -> SelectionViewController<MultipleMoviesCommand> {
           let selectionViewController = SelectionViewController(command: MultipleMoviesCommand(), onEndEditing: didReceiveUserResult)
           selectionViewController.onDismissCallback = {
               $0.dismiss(animated: true, completion: nil)
           }
           return selectionViewController
       }
    
    
    // MARK: - Values
    
    /// When receive result from `SingleNewsCommand`
    ///
    func didReceiveNewsResult(result: SelectionValue<SingleNewsCommand.Model>) {
        self.selectionLabel.text = ["Sources Name" ,
                                    result.singleValue?.newsSource?.name].compactMap { $0 }.joined(separator: " : \n")
    }
    
    /// When receive result from `MultipleUserCommand`
    ///
    func didReceiveUserResult(result: SelectionValue<MultipleUserCommand.Model>) {
        self.selectionLabel.text = result.listValue?.compactMap { " name: \($0.name) \n age: \($0.age)" }.joined(separator: " - \n")
    }
    
    /// When receive result from `MultipleMoviesCommand`
    ///
    func didReceiveUserResult(result: SelectionValue<MultipleMoviesCommand.Model>) {
        self.selectionLabel.text = result.listValue?.compactMap { " movie: \($0.title) Year: \($0.releaseDate)" }.joined(separator: " \n \n ")
    }
}
