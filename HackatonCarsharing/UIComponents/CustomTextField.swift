//
//  CustomTextField.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        borderStyle = .roundedRect
        layer.borderColor = UIColor(red: 153/256, green: 153/256, blue: 153/256, alpha: 1.0).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
    }
    
    func setPlaceholder(text: String) {
        let color = UIColor(red: 102/256, green: 102/256, blue: 102/256, alpha: 1.0)
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes: [NSAttributedString.Key.foregroundColor: color])
        
    }
    
    func dropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
        
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

}
