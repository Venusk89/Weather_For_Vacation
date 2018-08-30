//
//  TemperatureLabel.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 8. 30..
//  Copyright © 2018년 H. All rights reserved.
//

import UIKit

class TemperatureCurrentLabel: UILabel {
    
    var labelText: String? {
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
        guard let text = text else { return }
    }
}
