//
//  LandingButtonView.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class LandingButtonView: UIButton {
    
    var customLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    private func configureView() {
        self.imageView?.frame.size = CGSize(width: 50, height: 50)
        self.imageView?.contentMode = .scaleAspectFit
        
        self.clipsToBounds = true
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.semanticContentAttribute = .forceLeftToRight
        self.contentHorizontalAlignment = .left
        self.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: self.frame.width - 80)
        
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
        
        customLabel = UILabel(frame: CGRect(x: 60, y: 0, width: self.frame.width - 60, height: self.frame.height))
        customLabel.font = self.titleLabel?.font
        self.setTitle("", for: .normal)
        self.addSubview(customLabel)
    }
}
