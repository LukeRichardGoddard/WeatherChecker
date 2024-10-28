//
//  WeatherChecker.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import SwiftUI

@main
struct WeatherChecker: App {
    
    @State var model = WeatherModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: $needsOnboarding, onDismiss: {
                    needsOnboarding = false
                }, content: {
                    OnboardingView()
                        .environment(model)
                })
                .environment(model)
                .onAppear() {
                    // if no onboarding is needed, still get location
                    if needsOnboarding == false {
                        model.getUserLocation()
                    }
                }
        }
    }
}
