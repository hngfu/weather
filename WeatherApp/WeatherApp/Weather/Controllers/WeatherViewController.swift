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
    @IBOutlet weak var temperatureUnitButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Models
    private var weatherManager = SimpleWeatherManager()
    
    //MARK: - Methods
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.register(UINib(nibName: WeatherTableViewCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: WeatherTableViewCell.identifier)
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadTableView),
                                               name: .simpleWeatherDidAppended,
                                               object: weatherManager)
        
        let localInformations = Preference.shared.locals
        weatherManager.appendWeathers(with: localInformations)
        temperatureUnitButton.isSelected = !Preference.shared.isCelsius
    }
    
    @objc func reloadTableView(_ noti: Notification) {
        DispatchQueue.main.async {
            self.weatherTableView.reloadData()
        }
    }
    
    //MARK: IBAction
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        Preference.shared.isCelsius = !sender.isSelected
    }

    @IBAction func unwindToWeatherViewController(_ segue: UIStoryboardSegue) {
        guard segue.source is SearchViewController,
            let addedLocalInfo = Preference.shared.locals.last else { return }
        weatherManager.appendWeather(with: addedLocalInfo)
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherManager.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier,
                                                 for: indexPath)
        guard let weatherTableViewCell = cell as? WeatherTableViewCell,
            let simpleWeather = weatherManager[indexPath.row] else { return cell }
        weatherTableViewCell.showWith(localName: Preference.shared.locals[indexPath.row].name,
                                      time: simpleWeather.currently.time,
                                      celsius: simpleWeather.currently.temperature,
                                      weatherIconName: simpleWeather.currently.icon)
        return weatherTableViewCell
    }
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToDetailWeatherVC", sender: self)
    }
}
