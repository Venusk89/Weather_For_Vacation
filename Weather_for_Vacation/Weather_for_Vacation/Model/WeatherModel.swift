//
//  File.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 8. 28..
//  Copyright © 2018년 H. All rights reserved.
//

import Foundation
import UIKit

struct WeatherModel: Codable {
    var weather: Weather
    var common: Common
    var result: Result
}

struct Weather: Codable {
    var hourly: [Hourly]
}

struct Hourly: Codable {
    var grid: Grid
    var wind: Wind
    var precipitation: Precipitation
    var sky: Sky
    var temperature: Temperature
    var humidity: String
    var lightning: String
    var timeRelease: String
}

struct Grid: Codable {
    var latitude: String
    var longitude: String
    var city: String
    var county: String
    var village: String
}

struct Wind: Codable {
    var wdir: String
    var wspd: String
}

struct Precipitation: Codable {
    var sinceOntime: String
    var type: String
}

struct Sky: Codable {
    var code: String
    var name: String
}

struct Temperature: Codable {
    var tc: String
    var tmax: String
    var tmin: String
}

struct Common: Codable {
    var alertYn: String
    var stormYn: String
}

struct Result: Codable {
    var code: Int
    var requestUrl: String
    var message: String
}

