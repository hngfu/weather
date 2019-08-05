//
//  CityManager.swift
//  WeatherApp
//
//  Created by 조재흥 on 04/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import Foundation
import MapKit

class LocalManager {
    
    //MARK: - Properties
    private var mapItems = [MKMapItem]()
    
    //MARK: - Methods
    func count() -> Int {
        return mapItems.count
    }
    
    func perform(with handler: (String?) -> Void, from index: Int) {
        let mapItem = mapItems[index]
        handler(mapItem.placemark.title)
    }
    
    func search(with text: String?) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        MKLocalSearch(request: searchRequest).start { (response, error) in
            guard error == nil,
                let response = response else { return }

            self.mapItems = response.mapItems
        }
    }
}
