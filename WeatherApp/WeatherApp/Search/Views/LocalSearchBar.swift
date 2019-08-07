//
//  CitySearchBar.swift
//  WeatherApp
//
//  Created by 조재흥 on 04/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class LocalSearchBar: UISearchBar {
    
    //MARK: - Methods
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.textColor = .white
            let color = UIColor.lightGray.withAlphaComponent(0.05)
            textField.backgroundColor = color
        }
        self.setValue("취소", forKey: "cancelButtonText")
        
        self.showsCancelButton = true
        self.tintColor = .white
        
        self.keyboardAppearance = .dark
        self.returnKeyType = .search
        self.autocapitalizationType = .words
    }
}
