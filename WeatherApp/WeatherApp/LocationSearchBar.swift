//
//  LocationSearchBar.swift
//  WeatherApp
//
//  Created by 조재흥 on 04/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class LocationSearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.searchBarStyle = .minimal
        self.barStyle = .black
        self.showsCancelButton = true
        self.keyboardAppearance = .dark
        self.returnKeyType = .search
        self.autocapitalizationType = .words
        self.tintColor = .white
    }
}
