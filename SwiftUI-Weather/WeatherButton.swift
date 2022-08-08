//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Samit Koyom on 29/7/2565 BE.
//

import SwiftUI

struct WeatherButton: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        Button {
            isNight.toggle()
        } label: {
            Text(isNight ? "Change Day Time" : "Change Night Time")
                .frame(width: 250, height: 50)
                .background(.white)
                .foregroundColor(isNight ? .black : .blue)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
        }
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(isNight: .constant(false))
    }
}
