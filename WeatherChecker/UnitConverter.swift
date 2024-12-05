//
//  UnitConverter.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 5/12/2024.
//

import Foundation

struct UnitConverter {
    
    static func convertMetricToFahrenheit(metric: Double) -> Double {
        
        return (metric * 9 / 5) + 32
        
    }
    
    static func convertMetricToScientific(metric: Double) -> Double {
        
        return metric + 273.15
        
    }
    
}
