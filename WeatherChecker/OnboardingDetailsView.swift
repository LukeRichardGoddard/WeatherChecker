//
//  OnboardingDetailsView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 24/9/2024.
//

import SwiftUI

struct OnboardingDetailsView: View {
    
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack (alignment: .center) {
                Spacer()
                Spacer()
                Image(systemName: "cloud.sun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    
                Text(headline)
                    .font(.largeTitle)
                
                Text(subHeadline)
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top, 20)
                Spacer()
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .padding(.horizontal)
                        Text("Continue")
                            .bold()
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 50)
                Spacer()
                
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingDetailsView(bgColor: Color.blue, headline: "WeatherChecker", subHeadline: "The latest weather info for your city", buttonAction: {
        
    })
}
