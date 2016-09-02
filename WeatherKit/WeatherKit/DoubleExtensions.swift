//
//  DoubleExtensions.swift
//  WeatherKit
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import Foundation

public extension Double {
    enum TemperatureUnit {
        case Fahrenheit
        case Celsius
        
        func symbol() -> String {
            switch self {
            case .Fahrenheit:
                return " °F"
            case .Celsius:
                return " °C"
            }
        }
    }
    
    public func formatTemperature(unit: TemperatureUnit) -> String {
        return String(self) + unit.symbol()
    }
}