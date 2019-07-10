//
//  LandingButtonView.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class LandingButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.semanticContentAttribute = .forceLeftToRight
        self.contentHorizontalAlignment = .left
        self.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: self.frame.width - 80)
        self.titleEdgeInsets = UIEdgeInsets(top: 20, left: -(self.frame.width - 10), bottom: 20, right: 0)
        self.imageView?.contentMode = .scaleAspectFit
        
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
    }
}