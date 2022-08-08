//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Samit Koyom on 23/7/2565 BE.
//

import SwiftUI
    
struct ContentView: View {
    
    // สร้างตัวแปร @State ไว้สำหรับเปลี่ยนแปลงค่า UI
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            // เรียงรายการทั้งหมดแนวตั้ง
            VStack {
                
                Spacer()
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 60 : 76)
                
                Spacer()
                
                // จัดเรียงรายการอุณหภูมิแต่ละวันเป็นแนวนอน
                HStack (spacing: 20.0) {
                    
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 74)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 70)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind",
                        temperature: 66)
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 60)
                    
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "moon.fill",
                        temperature: 55)
                    
                }
                .padding()
                
                // กันพื้นที่ด้านล่างทั้งหมดด้วย Spacer()
                Spacer()
                
//                Button{
//                    // print("tabbed")
//                    isNight.toggle()
//                } label: {
//                    WeatherButtonLabelView(title: isNight ? "Change Day Time" : "Change Night Time",
//                                           textColor: isNight ? .black : .blue, backgroundColor: .white)
//                }
                
                WeatherButton(isNight: $isNight)
                
                // กันพื้นที่ด้านล่างทั้งหมดด้วย Spacer()
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    // สร้าง properties ไว้สำหรับ pass ค่าต่างใน sub view
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    // var topColor: Color
    // var bottomColor: Color
    
    // การ Binding ตัวแปร State มาจาก Struct แม่
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            // gradient: Gradient(colors: [topColor, bottomColor]),
            gradient: Gradient(colors: [
                isNight ? .black : .blue,
                isNight ? .gray : .white]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 5) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButtonLabelView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
