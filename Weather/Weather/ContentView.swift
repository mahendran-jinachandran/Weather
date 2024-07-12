//
//  ContentView.swift
//  Weather
//
//  Created by mahendran-14703 on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var isNight: Bool = false
    var body: some View {
        
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {

                CityTextView(cityName: "Cupertino, CA")
            
                MainWeatherView(temperature: 76, isNight: $isNight)
                
                HStack(spacing: 27) {
                    
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 76
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 76
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 76
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 76
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "snow",
                        temperature: 76
                    )
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size:16,weight: .medium))
                .foregroundStyle(.white)
            
            WeatherImage(imageName: imageName, width: 40, height: 40)
            
            Text("\(temperature)")
                .font(.system(size: 28,weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
   @Binding var isNight: Bool
    var body: some View {
        
        LinearGradient(
            colors: [
                isNight ? .black : .blue,
                isNight ? .gray : .lightBlue
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size:32,weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {

    var temperature: Int
    @Binding var isNight: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            
            WeatherImage(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", width: 180, height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 60,weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherImage: View {
    
    var imageName: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width,height: height)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .font(.system(size: 20,weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


#Preview {
    ContentView()
}
