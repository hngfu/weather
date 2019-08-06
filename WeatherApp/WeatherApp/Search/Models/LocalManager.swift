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
    subscript(index: Int) -> Coordinate? {
        guard (0..<mapItems.count) ~= index else { return nil }
        return mapItems[index].coordinate
    }
    
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
            NotificationCenter.default.post(name: .mapItemDidChanged, object: self)
        }
    }
}

extension Notification.Name {
    static let mapItemDidChanged = NSNotification.Name("mapItemDidChanged")
}

extension MKMapItem {
    var coordinate: Coordinate {
        return Coordinate(latitude: Float(self.placemark.coordinate.latitude),
                          longitude: Float(self.placemark.coordinate.longitude))
    }
}
