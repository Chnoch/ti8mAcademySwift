//
//  WeatherViewController.swift
//  Weatherly
//
//  Created by Admin on 02.09.16.
//  Copyright © 2016 Academy. All rights reserved.
//

import UIKit
import WeatherKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var searchText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearTemperatures()
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearTemperatures() {
        self.minTempLabel.text = ""
        self.maxTempLabel.text = ""
        self.tempLabel.text = ""
    }
    
    func loadWeather(text: String) {
        OpenWeatherMapService().getWeatherInformation(text) { (weather:Weather?, error:NSError?) in
            if let weather = weather {
                dispatch_async(dispatch_get_main_queue(), {
                    self.minTempLabel.text = weather.minTemp?.formatTemperature(.Celsius)
                    self.maxTempLabel.text = weather.maxTemp?.formatTemperature(.Celsius)
                    self.tempLabel.text = weather.currentTemp?.formatTemperature(.Celsius)
                })
            }
        }
    }
    
    @IBAction func pressButton() {
        if let text = searchText.text {
            clearTemperatures()
            loadWeather(text)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
