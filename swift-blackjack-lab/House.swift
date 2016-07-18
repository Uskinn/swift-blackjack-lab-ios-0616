//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Sergey Nevzorov on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    var mustHit: Bool { return handscore < 17 }
    
    override init(name: String) {
        super.init(name: name)
        tokens = 1000
    }
}