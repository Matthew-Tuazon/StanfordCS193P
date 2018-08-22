//
//  Card.swift
//  Concentration
//
//  Created by Matt Tuazon on 8/21/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import Foundation

struct Card { //struct similar to class, no inheritance, value types
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
