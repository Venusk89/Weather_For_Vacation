//
//  TemperatureLabel.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 8. 30..
//  Copyright © 2018년 H. All rights reserved.
//

import UIKit

class TemperatureCurrentLabel: UILabel {
    
    var labelText: String = "" {
        didSet {
            updateTitle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func updateTitle() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(TemperatureCurrentChanged(_:)), name: Notification.Name("TemperatureCurrentChanged"), object: nil)
        
        
    }
    
    @objc func TemperatureCurrentChanged(_ noti: Notification) {
        guard let info = noti.userInfo else { return }
        guard let decode = info["WeatherModel"] as? WeatherModel else { return }
        print("================== Noti =================")
        print(decode.weather.hourly[0].temperature.tc)
        
        
    }
}
