//
//  ShadowLabel.swift
//  WeatherApp
//
//  Created by 조재흥 on 06/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class ShadowLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = .zero
        self.layer.masksToBounds = false
    }
}
