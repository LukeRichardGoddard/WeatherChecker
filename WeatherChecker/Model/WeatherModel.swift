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
class WeatherModel: NSObject, CLLocationManagerDelegate {
    
    var weather = Weather()
    var units = ["Metric", "Farenheit", "Scientific"]
    var selectedUnits = 0
    var useCurrentLocation = true
    
    var searchText = ""
    var showDetails = false
    var service = DataService()
    
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getWeather() {
        
        Task {
            weather = await service.getWeather(unit: units[selectedUnits], searchText: searchText, userLocation: currentUserLocation)
        }
    }
    
    func getUserLocation() {
        
        // Check for permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // detect if user allowed, then request location
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentUserLocation == nil {
            currentUserLocation = locations.last?.coordinate
            
            getWeather()
        }
        
        manager.stopUpdatingLocation()
    }
}
