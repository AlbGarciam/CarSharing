//
//  SpinnerView.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class SpinnerView: UIView {
    
    let image = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        self.backgroundColor = .clear
        
        let backgroundView = UIView(frame: self.frame)
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.9)
        self.addSubview(backgroundView)
        
        image.frame = CGRect(x: (self.frame.width/2) - 30, y: (self.frame.height/2) - 100, width: 60, height: 60)
        image.image = UIImage(named: "spinner")
        image.contentMode = .scaleAspectFit
        self.addSubview(image)
        
        label.frame = CGRect(x: (self.frame.width/2) - 130, y: image.frame.origin.y + image.frame.height + 20, width: 260, height: 60)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 17)
        label.text = "Un momentín, estamos reservando tu plaza."
        self.addSubview(label)
        
        rotate()
    }
    
    private let kRotationAnimationKey = "rotationanimationkey"
    
    func rotate(duration: Double = 1) {
        if image.layer.animation(forKey: kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = Float.pi * 2.0
            rotationAnimation.toValue = 0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            image.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if image.layer.animation(forKey: kRotationAnimationKey) != nil {
            image.layer.removeAnimation(forKey: kRotationAnimationKey)
        }
    }
}
