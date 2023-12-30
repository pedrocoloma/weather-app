//
//  Temperature.swift
//  Weather App
//
//  Created by Pedro Coloma on 30/12/23.
//

import Foundation

// MARK: - Temp
struct Temperature: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
