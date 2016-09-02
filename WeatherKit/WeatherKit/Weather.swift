//
//  Weather.swift
//  WeatherKit
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import Foundation

public struct Weather {
    public var maxTemp: Double?
    public var minTemp: Double?
    public var currentTemp: Double?
    
    init(json: NSDictionary) {
        if let main = json["main"]{
            self.minTemp = main["temp_min"] as? Double
            self.maxTemp = main["temp_max"] as? Double
            self.currentTemp = main["temp"] as? Double
            
        }
    }
}