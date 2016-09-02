//
//  WeatherTest.swift
//  WeatherKit
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import XCTest
@testable import WeatherKit

class WeatherTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitializationWithJSON() {
        let json = loadJson("weather")
        
        let weather = Weather(json:json)
        
        XCTAssertNotNil(weather)
        XCTAssertNotNil(weather.minTemp)
        XCTAssertNotNil(weather.maxTemp)
        XCTAssertNotNil(weather.currentTemp)
    }
}
