//
//  ViewController.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 7. 20..
//  Copyright © 2018년 H. All rights reserved.
//

import UIKit
import Alamofire


class TemperatureViewController: UIViewController {
    
    @IBOutlet weak var weatherIconView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureMinMaxLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    let weatherURL: String = "https://api2.sktelecom.com/weather/current/hourly"
    var temperatureValue:String = "temperature"
    var girdValue: String = "grid"
    var skyValue: String = "sky"
    var humidityValue: String = "humidity"
    var timeReleaseValuse: String = "timeRelease"
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameter = [
            "version": "1",
//            "lat": "\(latitude)",
//            "lon": "\(longitude)",
                    "lat": "37.545474",
                    "lon": "127.057077",
            //        "city": "서울",
            //        "county": "강북구",
            //        "village": "송중동",
            "coordType": "EPSG3857",
            "addressType": "A02",
            "callback": "result"
        ]
        
        print("lat: \(latitude)")
        print("lon: \(longitude)")
        
        let url = URL(string: weatherURL)!
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(url, method: .get, parameters: parameter, headers: ["appKey":"627e4ac9-96a6-418e-b4b6-f097091cf7a8"]).responseData { (response) in
            
            let data = response.data
            
            let jsonObject = try! JSONSerialization.jsonObject(with: data!)
            print(jsonObject)
            let jsonDictionary = jsonObject as! [String : Any]
            //                        print(jsonDictionary)
            if let weather = jsonDictionary["weather"] {
                //                print(weather)
                let weatherDictionary = weather as! [String: Any]
                //                print(weatherDictionary)
                
                if let hourly = weatherDictionary["hourly"] {
                    //                                        print(hourly)
                    let hourlyArray = hourly as! Array<Any>
                    //                    print(hourlyArray[0])
                    let hourlyDictionary = hourlyArray[0] as! [String: Any]
                    print(hourlyDictionary)
                    // ************************* Temperature추출 ************************* //
                    if let hourlyDictionaryTemperatureValueData = hourlyDictionary[self.temperatureValue] {
                        //                        print(hourlyDictionaryValueData)
                        let hourlyDictionaryTemperatureValueDataDictionary = hourlyDictionaryTemperatureValueData as! [String: Any]
                        print(hourlyDictionaryTemperatureValueDataDictionary)
                        if let houlyDictionaryTemperatureValueDataDictionaryTmax = hourlyDictionaryTemperatureValueDataDictionary["tmax"],
                            let hourlyDictionaryTemperatureValueDataDictionaryTmin = hourlyDictionaryTemperatureValueDataDictionary["tmin"],
                            let hourlyDictionaryTemperatureValueDataDictionaryTc =
                            hourlyDictionaryTemperatureValueDataDictionary["tc"]  {
                            print(houlyDictionaryTemperatureValueDataDictionaryTmax)
                            //                            let doubleHoulyDictionaryTemperatureValueDataDictionaryTmax = houlyDictionaryTemperatureValueDataDictionaryTmax as! Double
                            print(hourlyDictionaryTemperatureValueDataDictionaryTmin)
                            //                            let doubleHourlyDictionaryTemperatureValueDataDictionaryTmin =
                            //                                hourlyDictionaryTemperatureValueDataDictionaryTmin as! Double
                            print(hourlyDictionaryTemperatureValueDataDictionaryTc)
                            //                            let doubleHourlyDictionaryTemperatureValueDataDictionaryTc =
                            //                                hourlyDictionaryTemperatureValueDataDictionaryTc as! Double
                            
                            
                            let stringTc = hourlyDictionaryTemperatureValueDataDictionaryTc as! String
                            let stringTcArray = stringTc.split(separator: ".")
                            let stringTcValue = stringTcArray[0]
                            
                            let stringTmax =
                                houlyDictionaryTemperatureValueDataDictionaryTmax as! String
                            let stringTmaxArray = stringTmax.split(separator: ".")
                            let stringTmaxValue = stringTmaxArray[0]
                            
                            let stringTmin = hourlyDictionaryTemperatureValueDataDictionaryTmin as! String
                            let stringTminArray = stringTmin.split(separator: ".")
                            let stingTminValue = stringTminArray[0]
                            
                            
                            self.temperatureLabel.text = String(stringTcValue) + "℃"
                            
                            self.temperatureMinMaxLabel.text = "\(stringTmaxValue)℃ / \(stingTminValue)℃"
                        }
                    }
                    // ************************* Location추출 ************************* //
                    if let hourlyDictionaryGirdValueData = hourlyDictionary[self.girdValue] {
                        //                        print(hourlyDictionaryGirdValueData)
                        let hourlyDictionaryGirdValueDataDictionary = hourlyDictionaryGirdValueData as! [String: Any]
                        print(hourlyDictionaryGirdValueDataDictionary)
                        if let hourlyDictionaryGirdValueDataDictionaryLatitude = hourlyDictionaryGirdValueDataDictionary["latitude"],
                            let hourlyDictionaryGirdValueDataDictionaryLongitude =
                            hourlyDictionaryGirdValueDataDictionary["longitude"],
                            let hourlyDictionaryGirdValueDataDictionaryCity = hourlyDictionaryGirdValueDataDictionary["city"],
                            let hourlyDictionaryGirdValueDataDictionaryCounty = hourlyDictionaryGirdValueDataDictionary["county"],
                            let hourlyDictionaryGirdValueDataDictionaryvillage = hourlyDictionaryGirdValueDataDictionary["village"] {
                            print(hourlyDictionaryGirdValueDataDictionaryLatitude)
                            print(hourlyDictionaryGirdValueDataDictionaryLongitude)
                            print(hourlyDictionaryGirdValueDataDictionaryCity)
                            print(hourlyDictionaryGirdValueDataDictionaryCounty)
                            print(hourlyDictionaryGirdValueDataDictionaryvillage)
                            
                            self.locationLabel.text = (hourlyDictionaryGirdValueDataDictionaryCity as! String) + " " + (hourlyDictionaryGirdValueDataDictionaryCounty as! String) + " " + (hourlyDictionaryGirdValueDataDictionaryvillage as! String)
                        }
                    }
                    // ************************* Sky추출 ************************* //
                    if let hourlyDictionarySkyValueData = hourlyDictionary[self.skyValue] {
                        let hourlyDictionarySkyValueDataDictionary = hourlyDictionarySkyValueData as! [String: Any]
                        print(hourlyDictionarySkyValueDataDictionary)
                        if let hourlyDictionarySkyValueDataDictionaryName = hourlyDictionarySkyValueDataDictionary["name"],
                            let hourlyDictionarySkyValueDataDictionaryCode = hourlyDictionarySkyValueDataDictionary["code"] {
                            
                            print(hourlyDictionarySkyValueDataDictionaryName)
                            print(hourlyDictionarySkyValueDataDictionaryCode)
                            
                            switch hourlyDictionarySkyValueDataDictionaryCode as! String {
                            case "SKY_O01":
                                self.weatherIconView.image = UIImage(named: "맑음")
                            case "SKY_O02":
                                self.weatherIconView.image = UIImage(named: "구름조금")
                            case "SKY_O03", "SKY_O07":
                                self.weatherIconView.image = UIImage(named: "구름많음")
                            case "SKY_O04", "SKY_O08":
                                self.weatherIconView.image = UIImage(named: "비")
                            case "SKY_O11", "SKY_O12":
                                self.weatherIconView.image = UIImage(named: "번개")
                            case "SKY_O05", "SKY_O13":
                                self.weatherIconView.image = UIImage(named: "눈")
                            default:
                                return
                            }
                        }
                    }
                    // ************************* Humidity추출 ************************* //
                    if let hourlyDictionaryHumidityValueData = hourlyDictionary[self.humidityValue] {
                        print(hourlyDictionaryHumidityValueData)
                    }
                    // ************************* TimeRelease추출 ************************* //
                    if let hourlyDictionaryTimeReleaseValueData = hourlyDictionary[self.timeReleaseValuse] {
                        print(hourlyDictionaryTimeReleaseValueData)
                    }
                }
            }
        }
    }
    func dissmissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}
