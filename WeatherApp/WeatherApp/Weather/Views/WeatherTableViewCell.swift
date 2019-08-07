//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by 조재흥 on 06/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    //MARK: Identifier
    static let identifier = "weatherTableViewCell"
    static let nibName = "WeatherTableViewCell"
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var timeLabel: ShadowLabel!
    @IBOutlet weak var localNameLabel: ShadowLabel!
    @IBOutlet weak var fahrenheitLabel: ShadowLabel!
    @IBOutlet weak var celsiusLabel: ShadowLabel!
    
    var isCelsius: Bool = true {
        didSet {
            celsiusLabel.isHidden = !isCelsius
            fahrenheitLabel.isHidden = isCelsius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeTemperatureUnit),
                                               name: .temperatureUnitDidChanged,
                                               object: Preference.shared)
        isCelsius = Preference.shared.isCelsius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc func changeTemperatureUnit(_ noti: Notification) {
        self.isCelsius = Preference.shared.isCelsius
    }
    
    func showWith(localName: String, time: Double, celsius: Float, weatherIconName: String) {
        self.localNameLabel.text = localName
        let date = Date(timeIntervalSince1970: time)
        self.timeLabel.text = date.timeText
        self.celsiusLabel.text = "\(UInt(celsius))°"
        self.fahrenheitLabel.text = "\(UInt(celsius.fahrenheit))°"
        self.weatherImageView.image = UIImage(named: "\(weatherIconName)-image")
    }
}

extension Date {
    var timeText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:ss"
        return dateFormatter.string(from: self)
    }
}

extension Float {
    var fahrenheit: Float {
        return self * 1.8 + 32
    }
}
