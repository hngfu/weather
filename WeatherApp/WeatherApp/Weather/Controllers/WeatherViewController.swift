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
        weatherTableView.register(UINib(nibName: WeatherTableViewCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: WeatherTableViewCell.identifier)
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(insertRow),
                                               name: .localWeatherDidAppended,
                                               object: weatherManager)
    }
    
    @objc func insertRow(_ noti: Notification) {
        DispatchQueue.main.async {
            let row = self.weatherManager.count() - 1
            self.weatherTableView.insertRows(at: [IndexPath(row: row, section: 0)],
                                             with: .automatic)
        }
    }
    
    //MARK: IBAction
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        for cell in weatherTableView.visibleCells {
            guard let cell = cell as? WeatherTableViewCell else { continue }
            cell.isCelsius = !sender.isSelected
        }
    }

    @IBAction func unwindToWeatherViewController(_ segue: UIStoryboardSegue) {
        guard let sourceViewController = segue.source as? SearchViewController,
            let localInfo = sourceViewController.selectedLocalInfo else { return }
        weatherManager.appendWeather(with: localInfo)
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
            let localWeather = weatherManager[indexPath.row] else { return cell }
        weatherTableViewCell.show(with: localWeather)
        return weatherTableViewCell
    }
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
