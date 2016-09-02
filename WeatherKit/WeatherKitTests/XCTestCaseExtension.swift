//
//  XCTestCaseExtension.swift
//  WeatherKit
//
//  Created by Michael Wolski on 02.09.16.
//  Copyright © 2016 spielwiese. All rights reserved.
//

import XCTest


extension XCTestCase {
    
    func loadJson(fileName:String) -> NSDictionary {
        let bundle = NSBundle(forClass: self.classForCoder)
        let path = bundle.pathForResource(fileName, ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
        return json
        
    }
    
}