//
//  URLSession+Task.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/15/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation
// MARK: - URLSession + Request
/// Simple implementation for fetching  data from remote
/// No Need in this demo to advanced network calling
///
extension URLSession {
    func request<T: Codable>(with url: String, completionHandler: @escaping (T?,  Error?) -> Void)  {
        guard let url = URL(string: url) else { return }
        self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            DispatchQueue.main.async {
                completionHandler(try? JSONDecoder().decode(T.self, from: data), nil)
            }
            
        }.resume()
    }
}
