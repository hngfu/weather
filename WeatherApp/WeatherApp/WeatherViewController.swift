//
//  ViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 03/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    //MARK: - Properties
    //MARK: IBOutlet
    @IBOutlet weak var weatherTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Models
    private var weatherManager = SimpleWeatherManager()
    
    //MARK: - Methods
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    //MARK: IBAction
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        sender.isSelected.toggle()
    }

    @IBAction func unwindToWeatherViewController(_ segue: UIStoryboardSegue) {
        guard let sourceViewController = segue.source as? SearchViewController,
            let localInfo = sourceViewController.selectedLocalInfo else { return }
        weatherManager.appendWeather(with: localInfo)
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
}

extension WeatherViewController: UITableViewDelegate {
}
