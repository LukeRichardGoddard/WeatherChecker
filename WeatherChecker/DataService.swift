//
//  DataService.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getWeather(unit: String) async -> Weather {
        
        guard apiKey != nil else {
            return Weather()
        }
        
        if let url = URL(string: "https://api.weatherstack.com/current?access_key=\(apiKey!)&query=-33.883,151.217&units=\(unit.lowercased().first ?? "m")") {
            
            var request = URLRequest(url: url)
            
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
