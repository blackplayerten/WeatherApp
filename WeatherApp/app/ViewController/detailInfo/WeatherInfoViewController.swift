//
//  WeatherInfoViewController.swift
//  WeatherApp
//
//  Created by Sasha Kurganova on 28.11.2021.
//

import Foundation
import UIKit

final class WeatherInfoViewController: UIViewController {
    private let imageView = UIImageView()
    private let degreeLabel = UILabel()
    private let windLabel = UILabel()
    private let pressureLabel = UILabel()
    private let feelslikeLabel = UILabel()

    private var weatherData: WeatherData

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureDataElements()
    }
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        super.init(nibName: nil, bundle: nil)
        fillData(withModel: weatherData)
    }
    
    func fillData(withModel: WeatherData) {
        degreeLabel.text =  "Temperature: " + String(withModel.current.temperature)
        windLabel.text = "Wind speed: " + String(withModel.current.wind_speed)
        pressureLabel.text = "Pressure: " + String(withModel.current.pressure)
        feelslikeLabel.text = "Feels like: " + String(withModel.current.feelslike)
    }
    
    private func configure() {
        view.backgroundColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = weatherData.location.country
    }
    
    private func configureDataElements() {
        [degreeLabel, windLabel, pressureLabel, feelslikeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .white
            view.addSubview($0)
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        imageView.image = UIImage(named: "sunny")
        
        degreeLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        degreeLabel.topAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -10).isActive = true
        
        windLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        windLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        pressureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pressureLabel.centerYAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 100).isActive = true
        
        feelslikeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        feelslikeLabel.centerYAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: 100).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
