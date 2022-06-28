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
        city.text = "Irun"
        city.textColor = .white
        city.translatesAutoresizingMaskIntoConstraints = false
        return city
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperature = UILabel()
        temperature.text = "20ºC"
        temperature.font = UIFont.systemFont(ofSize: 70.0)
        temperature.textColor = .white
        temperature.translatesAutoresizingMaskIntoConstraints = false
        return temperature
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = "Parcialmente nublado"
        description.textColor = .white
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var vstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(vstack)
        let constraints = [
            vstack.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            vstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vstack.bottomAnchor.constraint(equalToSystemSpacingBelow: vstack.bottomAnchor, multiplier: 1)
        ]
        NSLayoutConstraint.activate(constraints)
        vstack.addArrangedSubview(cityLabel)
        vstack.addArrangedSubview(temperatureLabel)
        vstack.addArrangedSubview(descriptionLabel)
    }


}

