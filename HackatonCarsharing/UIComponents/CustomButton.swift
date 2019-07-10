//
//  CustomButton.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    override open var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? UIColor.vfRed : UIColor.vfGrey
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        self.backgroundColor = isEnabled ? UIColor.vfRed : UIColor.vfGrey
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
    }
}
