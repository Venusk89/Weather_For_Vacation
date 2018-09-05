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
    
    let temperatureView = TemperatureView()
    let networkServiceModel = NetworkService(current: "hourly",
                                             method: HTTPMethod.get,
                                             parameters: [
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
                                                "callback": "result"],
                                             headers: ["appKey":"627e4ac9-96a6-418e-b4b6-f097091cf7a8"])
    
    var skyStatus: String = ""
    var temperatureCurrent: String = ""
    var temperatureMax: String = ""
    var temperatureMin: String = ""
    var location: String = ""
    var city: String = ""
    var county: String = ""
    var village: String = ""
    
    
    @IBOutlet weak var  WeatherImageView: WeatherImageView!
    @IBOutlet weak var TemperatureCurrentLabel: TemperatureCurrentLabel!
    @IBOutlet weak var TemperatureMinMaxLabel: TemperatureMinMaxLabel!
    @IBOutlet weak var LocationLabel: LocationLabel!
    
    override func viewDidLoad() {
        view.addSubview(temperatureView)
        networkServiceModel.alamofire()
        
        NotificationCenter.default.addObserver(self, selector: #selector(TemperatureCurrentChanged(_:)), name: Notification.Name("TemperatureCurrentChanged"), object: nil)
        
    }
    
    @objc func TemperatureCurrentChanged(_ noti: Notification) {
        guard let info = noti.userInfo else { return }
        guard let decode = info["WeatherModel"] as? WeatherModel else { return }
        print("================== Noti =================")
        print(decode.weather.hourly[0].temperature.tc)
        temperatureCurrent = decode.weather.hourly[0].temperature.tc
        TemperatureCurrentLabel.text = temperatureCurrent
        
        temperatureMax = decode.weather.hourly[0].temperature.tmax
        temperatureMin = decode.weather.hourly[0].temperature.tmin
        TemperatureMinMaxLabel.text = "\(temperatureMin) / \(temperatureMax)"
        
        city = decode.weather.hourly[0].grid.city
        county = decode.weather.hourly[0].grid.county
        village = decode.weather.hourly[0].grid.village
        print(city)
        print(county)
        print(village)
        LocationLabel.text = "\(city) \(county) \(village)"
        
         skyStatus = decode.weather.hourly[0].sky.code
        print(skyStatus)
        
        switch skyStatus {
        case "SKY_O01":
            WeatherImageView.image = UIImage(named:"맑음")
        case "SKY_O02":
            WeatherImageView.image = UIImage(named: "구름조금")
        case "SKY_O03", "SKY_O07":
            WeatherImageView.image = UIImage(named: "구름많이")
        case "SKY_O04", "SKY_O08":
            WeatherImageView.image = UIImage(named: "비")
        case "SKY_O05", "SKY_O09":
            WeatherImageView.image = UIImage(named: "눈")
        case "SKY_O11":
            WeatherImageView.image = UIImage(named: "번개")
        default:
            print("Error")
        }
    }
    
}
