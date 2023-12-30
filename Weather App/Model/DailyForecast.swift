//
//  DailyForecast.swift
//  Weather App
//
//  Created by Pedro Coloma on 30/12/23.
//

import Foundation

// MARK: - DailyForecast
struct DailyForecast: Codable {
    let dt: Int
    let temp: Temperature
    let weather: [Weather]
}
