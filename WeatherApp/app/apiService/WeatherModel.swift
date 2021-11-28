//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Sasha Kurganova on 28.11.2021.
//

import Foundation

struct WeatherData: Codable {
    var location: Location
    var current: Current
}

struct Location: Codable {
    var name: String
    var country: String
    var region: String
}

struct Current: Codable {
    var observation_time: String
    var temperature: Int
    var wind_speed: Int
    var pressure: Int
    var feelslike: Int
    
    
}

