//
//  File.swift
//  Weather_for_Vacation
//
//  Created by H on 2018. 8. 26..
//  Copyright © 2018년 H. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    @IBOutlet weak var mainButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            mainButton.setTitle("현재 위치를 선택하세요.", for: .normal)
            mainButton.setTitleColor(UIColor.black, for: .normal)
            mainButton.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

