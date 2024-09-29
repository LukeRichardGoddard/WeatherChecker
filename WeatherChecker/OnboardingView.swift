//
//  OnboardingView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 24/9/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        ZStack {
            
            if selectedViewIndex == 0 {
                Color.blue
            } else {
                Color.indigo
            }
            
            TabView (selection: $selectedViewIndex) {
                OnboardingDetailsView(bgColor: Color.blue, headline: "WeatherChecker", subHeadline: "The latest weather info for your city", buttonAction: {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                })
                .tag(0)
                
                OnboardingDetailsView(bgColor: Color.indigo, headline: "WeatherChecker", subHeadline: "Give the app permission to use your location", buttonAction: {
                    dismiss()
                })
                .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack (spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
