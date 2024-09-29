//
//  WeatherModel.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class WeatherModel {
    
    var weather = Weather()
    var units = ["Metric", "Farenheit", "Scientific"]
    var selectedUnits = 0
    var useCurrentLocation = false
    
    var searchText = ""
    var showDetails = false
    var service = DataService()
    
    
    func getWeather() {
        
        Task {
            weather = await service.getWeather(unit: units[selectedUnits], searchText: searchText)
        }
    }   
}
