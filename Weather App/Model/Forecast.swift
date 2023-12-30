//
//  Forecast.swift
//  Weather App
//
//  Created by Pedro Coloma on 30/12/23.
//

import Foundation

// MARK: - Forecast
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
