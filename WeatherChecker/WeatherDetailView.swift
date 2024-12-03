//
//  WeatherDetailView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 3/12/2024.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @Environment(WeatherModel.self) var model
    
    var body: some View {
        VStack {
            Text("Weather Checker")
                .font(.largeTitle)
            Spacer()
            HStack {
                Text("Wind Speed:")
                Spacer()
                Text("\(model.weather.current?.windSpeed ?? 0)")
            }
            HStack {
                Text("Wind Degree:")
                Spacer()
                Text("\(model.weather.current?.windDegree ?? 0)")
            }
            HStack {
                Text("Wind Direction:")
                Spacer()
                Text("\(model.weather.current?.windDir ?? "")")
            }
            HStack {
                Text("Pressure:")
                Spacer()
                Text("\(model.weather.current?.pressure ?? 0)")
            }
            HStack {
                Text("Precipitation:")
                Spacer()
                Text("\(model.weather.current?.precip ?? 0)")
            }
            HStack {
                Text("Humidity:")
                Spacer()
                Text("\(model.weather.current?.humidity ?? 0)")
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    WeatherDetailView()
        .environment(WeatherModel())
}
