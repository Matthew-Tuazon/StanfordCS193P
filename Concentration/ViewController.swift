//
//  ViewController.swift
//  Concentration
//
//  Created by Matt Tuazon on 8/21/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2) //lazy, not initialized until someone used it, can not have a didSet

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel() //look at cards, make sure match
        } else{
            print("Chosen card was not in cardButtons array.")
        }
        //flipCard(withEmoji: "👻", on: sender)
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1) //if cards match clear, if not face down
            }
        }
    }
    
    var emojiChoices = ["🦇","😈","🎃","👻","🙀","🍭","🍫","🍏"]

    var emoji = [Int:String]() //look up card identifier (Int) to get emoji (String)
    
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        
        
        return emoji[card.identifier] ?? "?"
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//           return "?"
//        }
    }
    
    func startNewRound(){ //to start new round we should replace cards back down and reset score to 0
        for n in 0..<cardButtons.count{
            game.cards[n].isFaceUp = false
            game.cards[n].isMatched = false
        }
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        flipCount = 0
        startNewRound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

