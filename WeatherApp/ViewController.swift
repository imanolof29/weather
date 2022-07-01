//
//  ViewController.swift
//  WeatherApp
//
//  Created by Imanol Ortiz on 28/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var weatherViewModel: WeatherViewModel!

    lazy var cityLabel: UILabel = {
        let city = UILabel()
        city.textColor = .white
        city.translatesAutoresizingMaskIntoConstraints = false
        return city
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperature = UILabel()
        temperature.font = UIFont.systemFont(ofSize: 70.0)
        temperature.textColor = .white
        temperature.translatesAutoresizingMaskIntoConstraints = false
        return temperature
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.textColor = .white
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var vstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cityLabel, temperatureLabel, descriptionLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        callToViewModelForUIUpdate()
    }
    
    private func callToViewModelForUIUpdate() {
        self.weatherViewModel = WeatherViewModel()
        self.weatherViewModel.bindWeatherViewModelToController = {
            self.configure()
        }
    }
    
    private func configure() {
        DispatchQueue.main.async {
            self.cityLabel.text = self.weatherViewModel.weatherData.name
            self.temperatureLabel.text = "\(Int(self.weatherViewModel.weatherData.main.temp)) K"
            self.descriptionLabel.text = self.weatherViewModel.weatherData.weather[0].description
        }
    }
    
    private func setUpViews() {
        view.addSubview(vstack)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            vstack.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            vstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vstack.bottomAnchor.constraint(equalToSystemSpacingBelow: vstack.bottomAnchor, multiplier: 1)
        ])
    }


}

