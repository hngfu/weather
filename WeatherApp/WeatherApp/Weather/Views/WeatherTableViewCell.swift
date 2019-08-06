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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func show(with localWeather: LocalWeather) {
        let weather = localWeather.weather.currently
        weatherImageView.image = UIImage(named: "\(weather.icon)-image")
        let date = Date(timeIntervalSince1970: weather.time)
        timeLabel.text = date.timeText
        localNameLabel.text = localWeather.localInfo.name
        celsiusLabel.text = "\(UInt(weather.temperature))°"
        fahrenheitLabel.text = "\(UInt(weather.temperature.fahrenheit))°"
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
