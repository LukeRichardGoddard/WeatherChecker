//
//  ContentView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var weather = Weather()
    var service = DataService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(weather.location?.country ?? "Loading")
        }
        .padding()
        .task {
            weather = await service.getWeather()
        }
    }
}

#Preview {
    ContentView()
}
