//
//  OpenWeatherMapService.swift
//  WeatherKit
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import Foundation

public class OpenWeatherMapService: WeatherService, ApiKeyProtocol {
    
    public let ServerUrlString = "http://api.openweathermap.org/data/2.5"
    public let ApiKey = "f8d24395c257cd1bfdf74a5b7a14fa32"
    
    public init() {}
    
    public func getWeatherInformation(cityName: String, completion: ((weather: Weather?, error: NSError?) -> Void)) {
        
        let session = NSURLSession.sharedSession()
        
        let urlString = ServerUrlString + "/weather?q=" + cityName + "&appid=" + ApiKey + "&units=metric"
        guard let url = NSURL(string: urlString) else {
            completion(weather: nil, error: nil)
            return
        }
        
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as?NSDictionary {
                            let weather = Weather(json: json)
                            completion(weather: weather, error: nil)
                        }
                    } catch {
                        completion(weather: nil, error: nil)
                    }
                }
            } else {
                completion(weather: nil, error: error)
            }
        }
        
        dataTask.resume()
    }
    
}