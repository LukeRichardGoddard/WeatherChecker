//
//  Weather.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import Foundation

struct Weather: Codable {
    var request: WeatherRequest?
    var location: WeatherLocation?
    var current: WeatherCurrent?
}

struct WeatherRequest: Codable {
    var type: String?
    var query: String?
    var language: String?
    var unit: String?
}

struct WeatherLocation: Codable {
    var name: String?
    var country: String?
    var region: String?
    var lat: String?
    var lon: String?
    var timezoneId: String?
    var localtime: String?
    var localtimeEpoch: Int?
    var utcOffset: String?
    
    enum CodingKeys: String, CodingKey {
        case timezoneId = "timezone_id"
        case localtimeEpoch = "localtime_epoch"
        case utcOffset = "utc_offset"
        case name
        case country
        case region
        case lat
        case lon
        case localtime
    }
}

struct WeatherCurrent: Codable {
    var observationTime: String?
    var temperature: Int?
    var weatherCode: Int?
    var weatherIcons: [String]?
    var weatherDescriptions: [String]?
    var windSpeed: Int?
    var windDegree: Int?
    var windDir: String?
    var pressure: Int?
    var precip: Int?
    var humidity: Int?
    var cloudcover: Int?
    var feelslike: Int?
    var uvIndex: Int?
    var visibility: Int?
    
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case uvIndex = "uv_index"
        case temperature
        case pressure
        case precip
        case humidity
        case cloudcover
        case feelslike
        case visibility
    }
}
