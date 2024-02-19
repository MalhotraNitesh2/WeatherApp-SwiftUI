 //
//  ContentView.swift
//  WeatherApp
//
//  Created by Nitesh Malhotra on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        //background color
        ZStack {
            BackgroundView(topColor: isNight ? .black:.blue
                           , bottomColor: isNight ? .gray: .lightBlue)
            
            VStack{
                CityTextView(cityname: "Cipertino ,CA")
                
                MainWeatherStatusView(imagename: isNight ? "moon.fill" : "cloud.sun.fill", temperature: 75)
                
                HStack(spacing : 20){
                  WeatherDayView(dayofWeek: "Tue",
                                 imagename: isNight ? "moon.stars.fill" :"cloud.sun.fill",
                                 temperature: 74)
                    WeatherDayView(dayofWeek: "Wed",
                                   imagename: "cloud.sun.rain.fill",
                                   temperature: 80)
                    WeatherDayView(dayofWeek: "Thu",
                                   imagename: "cloud.sun.bolt.fill",
                                   temperature: 65)
                    WeatherDayView(dayofWeek: "Fri",
                                   imagename: "wind.snow",
                                   temperature: 70)
                    WeatherDayView(dayofWeek: "Sat",
                                   imagename: "sun.max.fill",
                                   temperature: 69)
                }
                
                Spacer()
                
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
             
          
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayofWeek : String
    var imagename : String
    var temperature : Int
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 20,weight: .medium))
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var topColor : Color
    var bottomColor : Color
    var body: some View {
        LinearGradient(gradient : Gradient (colors: [topColor,bottomColor]),
             startPoint: .topLeading,
             endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityname : String
    var body: some View {
        Text(cityname)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imagename : String
    var temperature : Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
struct WeatherButton : View
{ 
    var title : String
    var textColor : Color
    var backgroundColor : Color
    
    var  body : some View{
        Text(title)
            .frame(width: 280,height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
    }
    
}
    
   
