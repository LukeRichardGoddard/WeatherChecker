//
//  WeatherChecker.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import SwiftUI

@main
struct WeatherChecker: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: Binding.constant(true), onDismiss: {
                    
                }, content: {
                    OnboardingView()
                })
        }
    }
}
