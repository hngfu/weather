//
//  LocalTableViewCell.swift
//  WeatherApp
//
//  Created by 조재흥 on 05/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class LocalTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    //MARK: IBOutlet
    @IBOutlet weak var localInfoLabel: UILabel!
    
    //MARK: Identifier
    static let identifier = "localTableViewCell"
    static let nibName = "LocalTableViewCell"

    //MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        self.selectedBackgroundView = backgroundView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
