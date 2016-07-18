//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Sergey Nevzorov on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    let suit: String
    let rank: String
    let cardLabel: String
    var cardValue: Int = 0
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        cardLabel = rank + suit
        cardValue = createCardValue()
        
    }
    
    private func createCardValue() -> Int {
        
        switch rank {
        case "A":  return 11
        case "K", "Q", "J", "10": return 10
        default: return Int(rank) ?? 0
            
        }
    }
    
    static func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    static func validRanks() -> [String] {
        return["K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
    }
    
}