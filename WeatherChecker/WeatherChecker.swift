//
//  WeatherChecker.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import SwiftUI

@main
struct WeatherChecker: App {
    
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: $needsOnboarding, onDismiss: {
                    needsOnboarding = false
                }, content: {
                    OnboardingView()
                })
        }
    }
}
