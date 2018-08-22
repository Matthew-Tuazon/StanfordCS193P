//
//  Concentration.swift
//  Concentration
//
//  Created by Matt Tuazon on 8/21/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//
//this is the model

import Foundation

class Concentration { //reference types, in comparison to struct,
   // var cards = Array<Card>()
    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil //two face up matched cards
            } else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards { //from 0 up to, not including numberOfPairsOfCards
            //1...numberOfPairsOfCards, 1, including.
            let card = Card()
            
            //let matchingCard = card
            
            
            cards.append(card)
            cards.append(card)
            
            //cards.append(matchingCard)

        }
        
        //TODO: Shuffle cards, add New Game Button
        
    }
}
