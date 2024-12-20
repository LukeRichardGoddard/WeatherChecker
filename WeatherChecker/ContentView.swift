//
//  ContentView.swift
//  WeatherChecker
//
//  Created by Luke Goddard on 21/9/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(WeatherModel.self) var model
    @Environment(\.colorScheme) var colorScheme
    
    // the below is to force the image to refresh when getting a new location
    @State var id = UUID()
    @State var tempText = " "
    
    @FocusState var queryBoxFocused: Bool
    
    var body: some View {
        
        @Bindable var model = model
        
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Color(colorScheme == .dark ? "DarkBackground" : "LightBackground")
                        .ignoresSafeArea()
                    
                    ScrollView {
                        VStack {
                            Text("Weather Checker")
                                .font(.largeTitle)
                            if model.weather.request?.query != nil {
                                AsyncImage(url: URL(string: model.weather.current?.weatherIcons?.first ?? "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png")!, placeholder: {Text(" ")}, image: { Image(uiImage: $0).resizable()})
                                    .frame(width: 200, height: 200)
                                    .clipShape(.rect(cornerRadius: 15))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(.black, lineWidth: 3)
                                    )
                                    .id(id)
                                
                                
                                HStack (alignment: .top, spacing: 0) {
                                    Text(tempText)
                                        .font(.largeTitle)
                                }
                                .onAppear() {
                                    updateTemp()
                                }
                                HStack {
                                    ForEach(model.weather.current?.weatherDescriptions ?? ["Unknown"], id: \.self) { description in
                                        Text(description)
                                    }
                                    .padding(.horizontal)
                                }
                                Text(model.weather.location?.name ?? " ")
                                    .font(.largeTitle)
                                Text(model.weather.location?.country ?? " ")
                                    .font(.title2)
                                
                            }
                            Spacer()
                            NavigationLink {
                                WeatherDetailView()
                            } label: {
                                Text("Show details")
                                    .padding()
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 15,
                                            style: .continuous
                                        )
                                        .stroke(colorScheme == .dark ? .white : .black, lineWidth: 5)
                                    )
                            }
                            .background(colorScheme == .light ? .white : .black)
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                            Spacer()
                            Section(header: Text("Weather Options")) {
                                Toggle(isOn: $model.useCurrentLocation) {
                                    Text("Use Current Location")
                                }
                                .onChange(of: model.useCurrentLocation, { oldValue, newValue in
                                    model.searchText = ""
                                    model.getWeather()
                                    id = UUID()
                                })
                                .padding(.horizontal)
                                
                                if !model.useCurrentLocation {
                                    HStack {
                                        Text("Location:")
                                        TextField("City", text: $model.searchText)
                                            .textFieldStyle(.roundedBorder)
                                            .focused($queryBoxFocused)
                                        
                                        Button {
                                            queryBoxFocused = false
                                            model.getWeather()
                                            id = UUID()
                                        } label: {
                                            Text("GO")
                                                .bold()
                                        }
                                        .buttonStyle(.borderedProminent)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                HStack {
                                    Text("Units:")
                                    Spacer()
                                    Picker(selection: $model.selectedUnits, label: Text("Units")
                                        ) {
                                        ForEach(0 ... model.units.count-1, id: \.self) {
                                            Text(self.model.units[$0])
                                        }
                                    }
                                    .accentColor(colorScheme == .dark ? .white : .black)
                                    .onChange(of: model.selectedUnits) { oldValue, newValue in
                                        updateTemp()
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                        }
                        .padding()
                        .frame(minHeight: geo.size.height)
                    }
                    .frame(width: geo.size.width)
                }
            }
        }
    }
    
    func updateTemp() {
        switch model.selectedUnits {
        case 0:
            tempText = "\(model.weather.current?.temperature ?? 0)°C"
        case 1:
            tempText = "\(UnitConverter.convertMetricToFahrenheit(metric: Double(model.weather.current?.temperature ?? 0)))°F"
        case 2:
            tempText = "\(UnitConverter.convertMetricToScientific(metric: Double(model.weather.current?.temperature ?? 0))) °K"
        default:
            tempText = "\(model.weather.current?.temperature ?? 0)°C"
        }
    
    }
}

#Preview {
    ContentView()
        .environment(WeatherModel())
}
