//
//  ShadowView.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class RoundedShadowedView : UIView {
    private var roundedLayer: CALayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if roundedLayer == nil {
            insertRoundedBackgroundLayer()
        }
        autoresizesSubviews = true
        roundedLayer?.frame = bounds
        addShadow()
    }
    
    private func insertRoundedBackgroundLayer() {
        let roundedLayer = CALayer(layer: layer)
        roundedLayer.backgroundColor = UIColor.white.cgColor
        roundedLayer.cornerRadius = 6
        roundedLayer.masksToBounds = true
        backgroundColor = .clear
        layer.insertSublayer(roundedLayer, below: getFirstSubview().layer)
        self.roundedLayer = roundedLayer
    }
    
    private func addShadow() {
        layer.masksToBounds = false
        clipsToBounds = false
        layer.shadowColor = UIColor.VFCardShadow.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 5
    }
    
    private func getFirstSubview() -> UIView {
        return subviews.first ?? self
    }
    
}

extension UIColor {
    static var VFCardShadow: UIColor {
        return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    }
}
