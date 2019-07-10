//
//  CustomTextField.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

@IBDesignable
class DropdownCustomTextField: CustomTextField {
    let inset: CGFloat = 32
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addImage()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: inset))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: inset))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: inset))
    }
    
    private func addImage() {
        let image = UIImage(named: "dropdownIcon")
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
    }
}
