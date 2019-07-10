//
//  AttributeView.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class AttributeView: UIView {
    
    let grey = UIColor(red: 102, green: 102, blue: 102, alpha: 1)
    let black = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    
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
        attributeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        attributeValue.leadingAnchor.constraint(equalTo: attributeTitle.trailingAnchor).isActive = true
        attributeValue.topAnchor.constraint(equalTo: attributeTitle.topAnchor).isActive = true
    }
    
    private func setStyle() {
        attributeTitle.font = UIFont(name: "Helvetica", size: 16)
        attributeTitle.textColor = grey
        attributeValue.font = UIFont(name: "Helvetica-Bold", size: 16)
        attributeValue.textColor = black
    }

}
