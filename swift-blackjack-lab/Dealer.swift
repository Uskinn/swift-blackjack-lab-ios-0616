//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Sergey Nevzorov on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    
    let deck: Deck = Deck()
    let house: House
    let player: Player
    var bet = 0
    
    init(house: House, player: Player) {
        
        self.house = house
        self.player = player
        
    }
}

//MARK: - Betting Functions

extension Dealer {
    
    func placeBet(bet: Int) -> Bool {
        
        let canPlaceBet = player.canPlaceBet(bet) && house.canPlaceBet(bet)
        if canPlaceBet { self.bet = bet }
        return canPlaceBet
    }
}

//MARK: - Dealing Functions

extension Dealer {
    
    func  deal() {
        
        deck.shuffle()
        let firstCardForPlayer = deck.drawCard()!
        let secondCardForPlayer = deck.drawCard()!
        
        let firstCardForHouse = deck.drawCard()!
        let secondCardForHouse = deck.drawCard()!
        
        player.dealCards([firstCardForPlayer, secondCardForPlayer])
        house.dealCards([firstCardForHouse, secondCardForHouse])
    }
    
    func turn(house: House) {
        
        if house.mayHit {
            
            print("Do you wish to hit or stay?")
        }
    }
    
    func winner() -> String {
        
        if player.busted { return "house" }
        if house.busted { return "player" }
        
        if house.blackjack { return "house" }
        if house.mustHit { return "no" }
        
        return "no"
    }
    
    func  award() -> String {
        
        let result = winner()
        
        switch result {
        case "house":
            house.didWin(bet: bet)
            player.didLose(bet: bet)
            return "house wins"
        case "player":
            player.didWin(bet: bet)
            house.didLose(bet: bet)
            return "player wins"
            
        default: return "no wins"
            
        }
    }
}




















