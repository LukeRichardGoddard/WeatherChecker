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
            Text(model.weather.location?.name ?? " ")
                .font(.largeTitle)
            Text(model.weather.location?.country ?? " ")
                .font(.title2)
            VStack {
                Text("Description:")
                ForEach(model.weather.current?.weatherDescriptions! ?? [""], id: \.self) {
                    desc in
                    Text(desc)
                }
            }
            Spacer()
            VStack {
                HStack {
                    Text("Latitude:")
                    Spacer()
                    Text("\(model.weather.location?.lat ?? " ")")
                }
                HStack {
                    Text("Longitude:")
                    Spacer()
                    Text("\(model.weather.location?.lon ?? " ")")
                }
                HStack {
                    Text("Timezone:")
                    Spacer()
                    Text("\(model.weather.location?.timezoneId ?? " ")")
                }
                HStack {
                    Text("Time offset:")
                    Spacer()
                    Text("\(model.weather.location?.utcOffset ?? " ")")
                }
                HStack {
                    Text("Wind Speed:")
                    Spacer()
                    Text("\(model.weather.current?.windSpeed ?? 0) kmph")
                }
                HStack {
                    Text("Wind Degree:")
                    Spacer()
                    Text("\(model.weather.current?.windDegree ?? 0)°")
                }
                HStack {
                    Text("Wind Direction:")
                    Spacer()
                    Text("\(model.weather.current?.windDir ?? "")")
                    Image(systemName: "arrow.up")
                        .rotationEffect(.degrees(WindDirections.compassToRotation(direction: model.weather.current?.windDir ?? "")))
                }
                HStack {
                    Text("UV Index:")
                    Spacer()
                    Text("\(model.weather.current?.uvIndex ?? 0)")
                }
                HStack {
                    Text("Pressure:")
                    Spacer()
                    Text("\(model.weather.current?.pressure ?? 0)")
                }
                HStack {
                    Text("Precipitation:")
                    Spacer()
                    Text("\(model.weather.current?.precip ?? 0.0)")
                }
                HStack {
                    Text("Humidity:")
                    Spacer()
                    Text("\(model.weather.current?.humidity ?? 0)")
                }
                HStack {
                    Text("Cloud Cover:")
                    Spacer()
                    Text("\(model.weather.current?.cloudcover ?? 0)")
                }
                HStack {
                    Text("Feels Like:")
                    Spacer()
                    Text("\(model.weather.current?.feelslike ?? 0)°")
                }
                HStack {
                    Text("Visibility:")
                    Spacer()
                    Text("\(model.weather.current?.visibility ?? 0)")
                }
                Spacer()
            }
            .padding(.horizontal, 50)
        }
        .padding(.horizontal)
    }
}

#Preview {
    WeatherDetailView()
        .environment(WeatherModel())
}
