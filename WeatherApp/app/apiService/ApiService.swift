//
//  ApiService.swift
//  WeatherApp
//
//  Created by Sasha Kurganova on 28.11.2021.
//

import Foundation

final class ApiService {
    
    func getWeatherData(city: String, completion: @escaping (WeatherData?, Error?)-> ()) {
        let request = configureURLRequest(city: city)

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                print("error")
                completion(nil, error)
            }
            if let response = response {
                print(response)
            }
            guard let data = data else {
                completion(nil, error)
                return
            }

            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(weatherData, nil)
            } catch let error {
                completion(nil, error)
            }
        }).resume()
    }
}
