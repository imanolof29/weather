//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Imanol Ortiz on 1/7/22.
//

import Foundation

class WeatherViewModel: NSObject {
    
    private var apiService: ApiService!
    
    private(set) var weatherData: WeatherResponse! {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = ApiService()
        getWeatherData()
    }
    
    func getWeatherData() {
        self.apiService.getWeatherData { (weatherData) in
            self.weatherData = weatherData
        }
    }
    
}
