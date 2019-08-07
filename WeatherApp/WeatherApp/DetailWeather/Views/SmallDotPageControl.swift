//
//  SmallDotPageControl.swift
//  WeatherApp
//
//  Created by 조재흥 on 07/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class SmallDotPageControl: UIPageControl {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
    }
}
