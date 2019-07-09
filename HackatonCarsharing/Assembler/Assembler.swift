//
//  Assembler.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

var assembler : Assembler {
    get {
        return Assembler.instance
    }
}

@objc final class Assembler : NSObject {
    @objc fileprivate static var instance = Assembler()
}
