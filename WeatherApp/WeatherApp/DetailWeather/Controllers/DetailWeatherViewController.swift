//
//  DetailWeatherViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 07/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    
    @IBOutlet weak var pageVCContainerView: UIView!
    @IBOutlet weak var pageVCPageControl: SmallDotPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
