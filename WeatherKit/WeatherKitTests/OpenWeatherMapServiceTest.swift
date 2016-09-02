//
//  OpenWeatherMapServiceTest.swift
//  WeatherKit
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import XCTest
@testable import WeatherKit

class OpenWeatherMapServiceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testServiceCall() {
        
        let expectation = expectationWithDescription("Weather Response available")
        
        let service = OpenWeatherMapService()
        
        service.getWeatherInformation("Zurich") { (weather, error) in
            XCTAssertNotNil(weather)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) in
            print(error)
        }
    }
    
    
}
