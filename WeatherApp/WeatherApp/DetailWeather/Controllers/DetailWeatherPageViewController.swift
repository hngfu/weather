//
//  DetailWeatherPageViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 07/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class DetailWeatherPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self

    }
}

extension DetailWeatherPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}

extension DetailWeatherPageViewController: UIPageViewControllerDelegate {
    
}
