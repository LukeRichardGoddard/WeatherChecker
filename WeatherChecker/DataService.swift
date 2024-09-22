//
//  DataService.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getWeather(unit: String, searchText: String) async -> Weather {
        
        guard apiKey != nil else {
            return Weather()
        }
        
        
        var query = "-33.883,151.217"
        
        print(searchText)
        
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
