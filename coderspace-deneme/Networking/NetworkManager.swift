//
//  NetworkManager.swift
//  coderspace-deneme
//
//  Created by ANIL GULGOR on 8.05.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func get(endpoint: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    func post(endpoint: String, parameters: [String: Any], completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: endpoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
}
