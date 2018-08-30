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
    
    
    @IBOutlet weak var TemperatureCurrentLabel: TemperatureCurrentLabel!
    
    override func viewDidLoad() {
        view.addSubview(temperatureView)
        networkServiceModel.alamofire()
        
//NotificationCenter.default.addObserver(forName: <#T##NSNotification.Name?#>, object: <#T##Any?#>, queue: OperationQueue?, using: <#T##(Notification) -> Void#>)
        
    }
    
    
}
