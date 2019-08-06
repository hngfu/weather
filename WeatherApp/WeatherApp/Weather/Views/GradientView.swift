//
//  GradientView.swift
//  WeatherApp
//
//  Created by 조재흥 on 05/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    //MARK: - Properties
    @IBInspectable
    var firstColor: UIColor = .clear {
        didSet {
            
        }
    }
    
    @IBInspectable
     var secondColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    
    //MARK: - Methods
    func updateView() {
        guard let layer = self.layer as? CAGradientLayer else { return }
        layer.colors = [firstColor, secondColor].map { $0.cgColor }
    }
}
