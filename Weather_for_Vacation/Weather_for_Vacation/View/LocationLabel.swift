//
//  LocationLabel.swift
//  Weather_for_Vacation
//
//  Created by H on 05/09/2018.
//  Copyright © 2018 H. All rights reserved.
//

import Foundation
import UIKit

class LocationLabel: UILabel {
    
    var labelText: String = "" {
        didSet {
            
        }
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
