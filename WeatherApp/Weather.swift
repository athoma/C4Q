//
//  Weather.swift
//  WeatherApp
//
//  Created by Adam Thoma-Perry on 8/11/18.
//  Copyright © 2018 Thoma-Perry, Adam. All rights reserved.
//

import Foundation

class Weather {
    var tempF: Int
    var tempC: Int
    var date: String
    var weather: String
    
    init(weather: String, date: String, tempF: Int, tempC: Int) {
        self.weather = weather
        self.date = date
        self.tempF = tempF
        self.tempC = tempC
    }
}
