//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var dealer: Dealer! = nil
    
    
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let house = House(name: "Bert")
        let player = Player(name: "Jimbo")
           
        dealer = Dealer(house: house, player: player)
    
        
        
        return true
    }
    
    func playBlackJack() {
        
        
    }
    

    
   }

