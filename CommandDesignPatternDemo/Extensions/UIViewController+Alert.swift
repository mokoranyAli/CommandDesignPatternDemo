//
//  UIViewController+Alert.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import UIKit

// MARK: - UIViewController+Alert
//
extension UIViewController {
    
    func displayAlert(with title: String?, message: String?, action: UIAlertAction = .ok) {
       guard presentedViewController == nil else {
         return
       }
       let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alertController.addAction(action)
       present(alertController, animated: true)
     }
}

extension UIAlertAction {
   static let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
}
