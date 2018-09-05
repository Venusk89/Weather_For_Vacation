//
//  NetworkService.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 8. 28..
//  Copyright © 2018년 H. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkService {
    
    private var current: String
    private var method: HTTPMethod
    private var parameters: [String: Any]
    private var headers: HTTPHeaders
    private let decoder = JSONDecoder()
    
    init(current: String, method: HTTPMethod, parameters: [String: Any], headers: HTTPHeaders) {
        self.current = current
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
    
    func alamofire() {
        
        let url: String = "https://api2.sktelecom.com/weather/current/\(current)"
        
        print("url = ", url, "method = ", method, "parameters = ", parameters, "headers = ", headers)
        
        Alamofire.request(url, method: method, parameters: parameters, headers: headers)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let decode = try self.decoder.decode(WeatherModel.self, from: value)
                        let decodeInfo: [String: WeatherModel] = ["WeatherModel": decode ]
                        
                        NotificationCenter.default.post(name: NSNotification.Name("TemperatureCurrentChanged"), object: self, userInfo: decodeInfo)

                    } catch {
                        print("Error")
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
}


