//
//  Preference.swift
//  WeatherApp
//
//  Created by 조재흥 on 07/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import Foundation

class Preference: Codable {
    static let key = "preferenceKey"
    static var shared = Preference()
    
    var locals = [LocalInfo]()
    
    func replaceProperty(_ preference: Preference) {
        self.locals = preference.locals
    }
}
