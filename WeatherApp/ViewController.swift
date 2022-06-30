//
//  ViewController.swift
//  WeatherApp
//
//  Created by Imanol Ortiz on 28/6/22.
//

import UIKit

class ViewController: UIViewController {

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
        configure()
    }
    
    private func configure() {
        cityLabel.text = "Irun"
        temperatureLabel.text = "20ºC"
        descriptionLabel.text = "Parcialmente nublado"
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

