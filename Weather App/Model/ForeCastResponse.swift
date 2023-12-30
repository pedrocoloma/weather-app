//
//  ForeCastResponse.swift
//  Weather App
//
//  Created by Pedro Coloma on 30/12/23.
//

import Foundation

// MARK: - ForeCastResponse
struct ForeCastResponse: Codable {
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
}
