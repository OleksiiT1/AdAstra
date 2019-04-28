//
//  CommonDataService.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation


enum CommonDataServiceError: Error {
    case wrongURL
    case wrongData
    case parsing
}

class CommonDataService {

    class func get<T:Codable>(link: String, completion: @escaping (T?, Error?)->()) {
        guard let url = URL(string: link) else { completion(nil, CommonDataServiceError.wrongURL); return  }
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else { completion(nil, error); return }
            guard let data = data else { completion (nil, CommonDataServiceError.wrongData); return }
            do {
                let parsedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(parsedResponse, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
