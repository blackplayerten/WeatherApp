//
//  WeatherListTableViewCell.swift
//  WeatherApp
//
//  Created by Sasha Kurganova on 28.11.2021.
//

import Foundation
import UIKit

final class WeatherListTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    func configure(withModel weather: WeatherData) {
        textLabel?.text = weather.location.country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
