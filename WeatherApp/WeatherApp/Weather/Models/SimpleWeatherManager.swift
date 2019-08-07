//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by 조재흥 on 06/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import Foundation

class SimpleWeatherManager {
    private var simpleWeathers = [SimpleWeather]()
    private let networkManager = NetworkManager()
    
    private let weatherURL = "https://api.darksky.net/forecast/"
    private let apiKey = "51e22ec0db359cffd84730e7d9db9c06/"
    private let option = "?lang=ko&exclude=[minutely,hourly,daily,alerts,flags]&units=si"
    
    subscript(index: Int) -> SimpleWeather? {
        guard (0..<simpleWeathers.count) ~= index else { return nil }
        return simpleWeathers[index]
    }
    
    func appendWeather(with localInfo: LocalInfo) {
        let coordinate = localInfo.coordinate
        let url = "\(weatherURL)\(apiKey)\(coordinate.latitude),\(coordinate.longitude)\(option)"
        guard let requestURL = URL(string: url) else { return }
        let successHandler = { (data: Data) -> Void in
            let decoder = JSONDecoder()
            guard let simpleWeather = try? decoder.decode(SimpleWeather.self, from: data) else { return }
            self.simpleWeathers.append(simpleWeather)
            NotificationCenter.default.post(name: .simpleWeatherDidAppended,
                                            object: self)
        }
        networkManager.fetch(with: requestURL, successHandler: successHandler)
    }
    
    func appendWeathers(with localInformations: [LocalInfo]) {
        for localInfo in localInformations {
            appendWeather(with: localInfo)
        }
    }
    
    func count() -> Int {
        return simpleWeathers.count
    }
}

extension Notification.Name {
    static let simpleWeatherDidAppended = NSNotification.Name("simpleWeatherDidAppended")
}
