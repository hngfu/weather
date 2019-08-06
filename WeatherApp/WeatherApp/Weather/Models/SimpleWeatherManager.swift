//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by 조재흥 on 06/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import Foundation

class SimpleWeatherManager {
    private var localWeather = [LocalWeather]()
    private let networkManager = NetworkManager()
    
    private let weatherURL = "https://api.darksky.net/forecast/"
    private let apiKey = "51e22ec0db359cffd84730e7d9db9c06/"
    private let option = "?lang=ko&exclude=[minutely,hourly,daily,alerts,flags]&units=si"
    
    subscript(index: Int) -> LocalWeather? {
        guard (0..<localWeather.count) ~= index else { return nil }
        return localWeather[index]
    }
    
    func appendWeather(with localInfo: LocalInfo) {
        let coordinate = localInfo.coordinate
        let url = "\(weatherURL)\(apiKey)\(coordinate.latitude),\(coordinate.longitude)\(option)"
        guard let requestURL = URL(string: url) else { return }
        networkManager.fetch(with: requestURL) { (data) in
            let decoder = JSONDecoder()
            guard let weather = try? decoder.decode(Weather.self,
                                                    from: data) else { return }
            let localWeather = LocalWeather(localInfo: localInfo, weather: weather)
            self.localWeather.append(localWeather)
            NotificationCenter.default.post(name: .localWeatherDidAppended,
                                            object: self)
        }
    }
    
    func count() -> Int {
        return localWeather.count
    }
}

extension Notification.Name {
    static let localWeatherDidAppended = NSNotification.Name("localWeatherDidAppended")
}
