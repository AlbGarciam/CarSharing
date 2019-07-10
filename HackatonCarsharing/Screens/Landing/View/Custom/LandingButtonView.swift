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
        self.setTitleColor(.black, for: .normal)
        self.semanticContentAttribute = .forceLeftToRight
        self.contentHorizontalAlignment = .left
        self.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: self.frame.width - 60)
        self.titleEdgeInsets = UIEdgeInsets(top: 20, left: -(self.frame.width - 20), bottom: 20, right: 20)
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
    }
}
