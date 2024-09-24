//
//  OnboardingView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 24/9/2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingDetailsView(bgColor: Color.blue, headline: "WeatherChecker", subHeadline: "The latest weather info for your city", buttonAction: {
                
            })
            
            OnboardingDetailsView(bgColor: Color.green, headline: "WeatherChecker", subHeadline: "Give the app permission to use your location", buttonAction: {
                
            })
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
