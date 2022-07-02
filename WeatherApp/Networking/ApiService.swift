//
//  ApiService.swift
//  WeatherApp
//
//  Created by Imanol Ortiz on 1/7/22.
//

import Foundation

class ApiService: NSObject {
    
    private let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=43.33&lon=-1.78&appid=2968c2e0df10c3f99ac1b74a17c2e56c")!
    
    func getWeatherData(completion: @escaping (WeatherResponse) ->()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let weather = try! JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(weather)
            }
        }.resume()
    }
}
