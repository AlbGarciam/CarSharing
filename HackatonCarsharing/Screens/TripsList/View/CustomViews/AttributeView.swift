//
//  AttributeView.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class AttributeView: UIView {
    
    lazy var attributeTitle: UILabel = {
        let attributeTitle = UILabel()
        attributeTitle.translatesAutoresizingMaskIntoConstraints = false
        attributeTitle.numberOfLines = 0
        return attributeTitle
    }()
    
    lazy var attributeValue: UILabel = {
        let attributeValue = UILabel()
        attributeValue.translatesAutoresizingMaskIntoConstraints = false
        attributeValue.numberOfLines = 0
        return attributeValue
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        addSubview(attributeTitle)
        addSubview(attributeValue)
        setAutoLayout()
        setStyle()
    }
    
    private func setAutoLayout() {
        attributeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        attributeTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        attributeValue.leadingAnchor.constraint(equalTo: attributeTitle.trailingAnchor, constant: 2).isActive = true
        attributeValue.centerYAnchor.constraint(equalTo: attributeTitle.centerYAnchor).isActive = true
    }
    
    private func setStyle() {
        attributeTitle.font = UIFont(name: "HelveticaNeue", size: 14)
        attributeTitle.textColor = .vfGrey2
        attributeValue.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        attributeValue.textColor = .vfBlack
    }
}
