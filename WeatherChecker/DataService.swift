//
//  DataService.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getWeather(unit: String, searchText: String, userLocation: CLLocationCoordinate2D?) async -> Weather {
        
        guard apiKey != nil else {
            return Weather()
        }
        
        // Default lat long
        var lat = -33.883
        var long = 151.217
        
        // User's lat long
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        var query = "\(lat),\(long)"
        
        //print(searchText)
        
        // Search text overrides location
        if searchText != "" {
            query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        
        if let url = URL(string: "https://api.weatherstack.com/current?access_key=\(apiKey!)&query=\(query)&units=\(unit.lowercased().first ?? "m")") {
            
            let request = URLRequest(url: url)
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                
                return weather
                
            } catch {
                print(error)
            }
            
        }
     
        return Weather()
        
    }
    
}
