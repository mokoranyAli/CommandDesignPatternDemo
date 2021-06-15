//
//  NetworkManager.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation

// MARK: - Netowrk protocol
//
protocol Networkable {
    func loadData<T: Codable>(url: String, completion: @escaping (T?, Error?) -> Void)
}

// MARK: - Manager
//
/// This is just to make a simple get request
/// No need in this demo for complex network, we just try command
///
class NetowkManager: Networkable {
    
    // MARK: - Properties
    
    let session = URLSession.shared
    
    static let shared: Networkable = NetowkManager()
    
    func loadData<T>(url: String, completion: @escaping (T?, Error?) -> Void) where T: Codable {
        session.request(with: url, completionHandler: completion)
    }
}
