//
//  String.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func stringFromHTML(fontSize: Float = 16, fontName: String = "HelveticaNeue", alignment: NSTextAlignment = .left, color: UIColor = .black) -> NSMutableAttributedString? {
        let styleText = "<html> <head> <style type='text/css'> body { font: \(fontSize)px'\(fontName)'}</style></head> <body>"
        let html = styleText + self
        
        if let data = html.data(using: String.Encoding.unicode) {
            do {
                let attributedText = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                
                //Alignment & Color
                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center
                attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraph , NSAttributedString.Key.foregroundColor : color], range: NSMakeRange(0, attributedText.length))

                return attributedText
            }  catch _ as NSError {
                print("Couldn't translate")
            }
        }
        return nil
    }
}
