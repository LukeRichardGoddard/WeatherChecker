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
            Text(weather.location?.name ?? "")
            Text(weather.location?.country ?? "Loading")
            HStack (alignment: .top, spacing: 0) {
                Text("\(weather.current?.temperature ?? 0)")
                    .font(.largeTitle)
                Text("°")
                Text("C")
                    .font(.largeTitle)
            }
            
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
