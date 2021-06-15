//
//  UITableView+Handlers.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - UITableView+Handlers
//
extension UITableView {
    
    /// Dequeue a previously registered cell by it's class `reuseIdentifier` property.
    /// Failing to dequeue the cell will throw a `fatalError`
    ///
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.classNameWithoutNamespaces, for: indexPath) as? T else {
            let message = "Could not dequeue cell with identifier \(T.classNameWithoutNamespaces) at \(indexPath)"
            fatalError(message)
        }
        return cell
    }
}
