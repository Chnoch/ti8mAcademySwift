//
//  WeatherService.swift
//  WeatherKit
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import Foundation

public protocol WeatherService {
    
    var ServerUrlString:String {get}
    
    func getWeatherInformation(cityName: String, completion:((weather: Weather?, error: NSError?) -> Void))
    
}