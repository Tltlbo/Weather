//
//  ViewController.swift
//  Weather
//
//  Created by 박진성 on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var weatherDiscription: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tapWeatherFetchButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func getCurrentWeather(cityName : String) {
        guard let url = URL(string : "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=8ddbb342fa736fddf4b75f66ec875df9") else {return}
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            let decoder = JSONDecoder()
            let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
            debugPrint(weatherInformation)
        }.resume()
    }
}

