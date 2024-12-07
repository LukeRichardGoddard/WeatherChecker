//
//  WindDirections.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 7/12/2024.
//

import Foundation

struct WindDirections {
    
    static func compassToRotation(direction: String) -> Double {
        
        switch direction {
            
        case "N":
            return 0
        case "NNE":
            return 22.5 * 1
        case "NE":
            return 22.5 * 2
        case "ENE":
            return 22.5 * 3
        case "E":
            return 22.5 * 4
        case "ESE":
            return 22.5 * 5
        case "SE":
            return 22.5 * 6
        case "SSE":
            return 22.5 * 7
        case "S":
            return 22.5 * 8
        case "SSW":
            return 22.5 * 9
        case "SW":
            return 22.5 * 10
        case "WSW":
            return 22.5 * 11
        case "W":
            return 22.5 * 12
        case "WNW":
            return 22.5 * 13
        case "NW":
            return 22.5 * 14
        case "NNW":
            return 22.5 * 15
        default:
            return 0
            
        }
        
    }
    
}
