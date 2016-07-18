//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Sergey Nevzorov on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Player {
    
    let name: String
    var cards: [Card] = []
    var handscore: Int { return createHandScore() }
    var blackjack: Bool { return checkForBlackJack() }
    var busted: Bool { return checkIfBusted() }
    var stayed = false
    var mayHit: Bool { return playerCanHit() }
    var tokens: Int = 100
    var description: String {
        
        return "Current stuff is fun!"
    }
    
    init(name: String) {
        self.name = name
        
    }
    
}

//: MARK - Computed Property Helper Method

extension Player {
    
    private func createHandScore() -> Int {
        
        var aces: [Int] = []
        var finalHandScore = 0
        
        for card in cards {
            
            switch card.cardValue {
            case 11: aces.append(11)
            default: finalHandScore + card.cardValue
                
            }
        }
        
        if !aces.isEmpty {
            
            if aces.count > 1 {
                
                if finalHandScore + 11 + 1 > 21 {
                    finalHandScore += aces.count
                } else {
                    finalHandScore += 11 + (aces.count - 1)
                }
            }
        }
        
        return finalHandScore
    }
    
    private func checkForBlackJack() -> Bool {
        
        guard cards.count > 2 else { return false }
        
        let firstCard = cards[0]
        let secondCard = cards[1]
        
        return firstCard.cardValue + secondCard.cardValue == 21
    }
    
    private func checkIfBusted() -> Bool {
        return handscore > 21
        
    }
    
    private func playerCanHit() -> Bool {
        
        return !busted && !blackjack && !stayed
    }
}


//: MARK - Placing Bet Functions

extension Player {
    
    func canPlaceBet(bet: Int) -> Bool {
        
        return bet <= tokens
    }
}

//: MARK - Win or Lose Functions

extension Player {
    
    func didWin(bet bet: Int) {
        
        tokens += bet
    }
    
    func didLose(bet bet: Int) {
        tokens -= bet
        
    }
    
}

// MARK: - Dealing Cards to Player Methods

extension Player {
    
    func dealCards(card: [Card]) {
        
        for card in cards {
            self.cards.append(card)
            
        }
    }
}

















