//
//  Weather.swift
//  WeatherApp
//
//  Created by 조재흥 on 06/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let currently: DetailInfo
    
    struct DetailInfo: Decodable {
        let time: Double
        let temperature: Float
        let icon: String
    }
}
