//
//  Service.swift
//  Weather App
//
//  Created by Pedro Coloma on 29/12/23.
//

import Foundation

class Service {
    let baseUrl = "https://api.openweathermap.org/data/3.0/onecall"
    let apiKey = "b3b8f668e25f83e15843e24503e531c0"
    let session = URLSession.shared
   
    
    func fetchData(city: City, _ completion: @escaping  (ForeCastResponse?) -> Void) {
        let urlString = "\(baseUrl)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return  }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let forecast = try JSONDecoder().decode(ForeCastResponse.self, from: data)
                completion(forecast)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
}

// MARK: - Temperatures
struct ForeCastResponse: Codable {
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
}

// MARK: - Current
struct Forecast: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, weather, humidity
        case windSpeed = "wind_speed"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Daily
struct DailyForecast: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
