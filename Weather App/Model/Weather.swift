//
//  Weather.swift
//  Weather App
//
//  Created by Pedro Coloma on 30/12/23.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}
