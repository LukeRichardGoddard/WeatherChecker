//
//  ContentView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var weather = Weather()
    @State var units = ["Metric", "Farenheit", "Scientific"]
    @State var selectedUnits = 0
    @State var showDetails = false
    var service = DataService()
    
    var body: some View {
        VStack {
            Text("Weather Checker")
                .font(.largeTitle)
            if weather.request?.query != nil {
                AsyncImage(url: URL(string: weather.current?.weatherIcons?.first ?? "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png")!, placeholder: {Text(" ")}, image: { Image(uiImage: $0).resizable()})
                    .frame(width: 200, height: 200)
                
                
                HStack (alignment: .top, spacing: 0) {
                    Text("\(weather.current?.temperature ?? 0)")
                        .font(.largeTitle)
                    Text("°")
                    if let unit = weather.request?.unit {
                            switch unit {
                            case "m":
                                Text("C").font(.largeTitle)
                            case "s":
                                Text("K").font(.largeTitle)
                            case "f":
                                Text("F").font(.largeTitle)
                            default:
                                Text("").font(.largeTitle)
                                Image(systemName: "pencil")
                            }
                    }
                }
                HStack {
                    ForEach(weather.current?.weatherDescriptions ?? ["Unknown"], id: \.self) { description in
                        Text(description)
                    }
                    .padding(.horizontal)
                }
                Text(weather.location?.name ?? " ")
                    .font(.largeTitle)
                Text(weather.location?.country ?? " ")
                    .font(.title2)
                if showDetails {
                    VStack {
                        HStack {
                            Text("Wind Speed:")
                            Spacer()
                            Text("\(weather.current?.windSpeed ?? 0)")
                        }
                        HStack {
                            Text("Wind Degree:")
                            Spacer()
                            Text("\(weather.current?.windDegree ?? 0)")
                        }
                        HStack {
                            Text("Wind Direction:")
                            Spacer()
                            Text("\(weather.current?.windDir ?? "")")
                        }
                        HStack {
                            Text("Pressure:")
                            Spacer()
                            Text("\(weather.current?.pressure ?? 0)")
                        }
                        HStack {
                            Text("Precipitation:")
                            Spacer()
                            Text("\(weather.current?.precip ?? 0)")
                        }
                        HStack {
                            Text("Humidity:")
                            Spacer()
                            Text("\(weather.current?.humidity ?? 0)")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
            Section(header: Text("Weather Options")) {
                HStack {
                    Text("Units:")
                    Spacer()
                    Picker(selection: $selectedUnits, label: Text("Units")) {
                        ForEach(0 ... units.count-1, id: \.self) {
                            Text(self.units[$0])
                        }
                    }
                }
                .padding(.horizontal)

                Toggle(isOn: $showDetails) {
                    Text("Show details")
                }
                .padding(.horizontal)
            }
            Button {
                Task {
                    weather = await service.getWeather(unit: units[selectedUnits])
                }
            } label: {
                Text("Get Weather")
            }
            
        }
        .padding()
        .task {
        }
    }
}

#Preview {
    ContentView()
}
