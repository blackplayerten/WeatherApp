//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Sasha Kurganova on 28.11.2021.
//

import Foundation
import UIKit

final class WeatherListViewController: UIViewController {
    private lazy var weatherListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: "listCell")
        tableView.estimatedRowHeight = view.bounds.height / 3
        return tableView
    }()
    
    private var apiService: ApiService?
    private var weatherListData: [WeatherData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        setupWeatherTableView()

        apiService = ApiService()
        loadWeatherData()
    }

    private func setupNavigation() {
        navigationItem.title = "Список городов"
    }

    private func setupWeatherTableView() {
        view.addSubview(weatherListTableView)
        weatherListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        weatherListTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        weatherListTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }

    private func loadWeatherData() {
        guard let apiService = apiService else {
            return
        }

        apiService.getWeatherData(city: "New York", completion: { [weak self] (weatherData, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    self.present(UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert), animated: true)
                    return
                }
                if let weatherData = weatherData {
                    self.weatherListData.append(weatherData)
                }
                self.weatherListTableView.reloadData()
            }
        })

        apiService.getWeatherData(city: "Moscow", completion: { [weak self] (weatherData, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    self.present(UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert), animated: true)
                    return
                }
                if let weatherData = weatherData {
                    self.weatherListData.append(weatherData)
                }
                self.weatherListTableView.reloadData()
            }
        })

        apiService.getWeatherData(city: "London", completion: { [weak self] (weatherData, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    self.present(UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert), animated: true)
                    return
                }
                if let weatherData = weatherData {
                    self.weatherListData.append(weatherData)
                }
                self.weatherListTableView.reloadData()
            }
        })

        apiService.getWeatherData(city: "Berlin", completion: { [weak self] (weatherData, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    self.present(UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert), animated: true)
                    return
                }
                if let weatherData = weatherData {
                    self.weatherListData.append(weatherData)
                }
                self.weatherListTableView.reloadData()
            }
        })
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherInfoViewController = WeatherInfoViewController(weatherData: self.weatherListData[indexPath.row])
        navigationController?.pushViewController(weatherInfoViewController, animated: true)
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? WeatherListTableViewCell else { return .init() }
        cell.configure(withModel: weatherListData[indexPath.row])
        return cell
    }
}
