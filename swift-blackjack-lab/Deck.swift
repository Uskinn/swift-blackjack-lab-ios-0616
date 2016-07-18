//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Sergey Nevzorov on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import GameKit

class Deck {
    
    private var undealtCards: [Card] = []
    private var dealtCards: [Card] = []
    var description: String {
        return "Cards Remaining: \(undealtCards.count)\n Cards Dealt: \(dealtCards.count)"
    }
    
    init() {
        createDeck()
    }
    
    private func createDeck() {
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                let card = Card(suit: suit, rank: rank)
                undealtCards.append(card)
            }
        }
    }
}

// MARK: - Deal Methods

extension Deck {
    
    
    func drawCard() -> Card? {
        
        guard !undealtCards.isEmpty else { return nil }
        
        let cardToBeDealt = undealtCards.removeLast()
        dealtCards.append(cardToBeDealt)
        return cardToBeDealt
    }
    
    func shuffle() {
        
        undealtCards.appendContentsOf(dealtCards)
        dealtCards.removeAll()
        
        undealtCards = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(undealtCards) as! [Card]
    }
}








