//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by 조재흥 on 06/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import Foundation

class NetworkManager {
    func fetch(with url: URL, successHandler: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            guard let data = data,
                let response = response as? HTTPURLResponse,
                200...299 ~= response.statusCode else { return }
            
            successHandler(data)
            }.resume()
    }
}
