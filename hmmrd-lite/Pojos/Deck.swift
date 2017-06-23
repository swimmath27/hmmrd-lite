//
//  Deck.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/21/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import Foundation

import Firebase
import FirebaseDatabase

class Deck {
  fileprivate(set) static var singleton: Deck = Deck();

  fileprivate var deck = [Card]()
  fileprivate var order:[Int] = [Int]()
  fileprivate var index:Int = 0

  fileprivate var ref: DatabaseReference!

  // Called from AppDelegate after firebase is configured.
  func load() {
    self.getCardsFromFirebase();
  }

  fileprivate func getCardsFromFirebase(){
    self.ref = Database.database().reference();
    // load once - don't bother updating during the game.
    self.ref.child("Cards").observeSingleEvent(of: .value, with: { (snapshot) in
      self.loadCardsFIR(snapshot: snapshot);
      self.shuffle();
    }) { (error) in
      print(error.localizedDescription)
    }
  }

  fileprivate func loadCardsFIR(snapshot: DataSnapshot) {
    objc_sync_enter(deck)

    var headCount:Int = 0;
    var muscleCount:Int = 0;
    var moxieCount:Int = 0;
    var randomCount:Int = 0;
    var drinkCount:Int = 0;

    let cards = snapshot.value as! Array<Any>
    for item in cards {
      if let card = item as? Dictionary<String, String> {
        var suit:Card.Suit = .invalid;
        var rank:Int = 0;
        switch card["type"]! {
        case "head":
          headCount+=1
          rank = headCount;
          suit = .head;
        case "muscle":
          muscleCount+=1
          rank = muscleCount
          suit = .muscle;
        case "moxie":
          moxieCount+=1
          rank = moxieCount;
          suit = .moxie;
        case "random":
          randomCount+=1
          rank = randomCount
          suit = .random;
        case "drink":
          drinkCount+=1
          rank = drinkCount
          suit = .drink;
        default:break
        }

        let c = Card(suit: suit,
                     rank: rank,
                     name: card["name"]!,
                     instructions: card["instructions"]!,
                     description: card["description"]!,
                     successMessage: card["success"]!,
                     failureMessage: card["failure"]!)
        
        self.deck.append(c)
      }
    }
    objc_sync_exit(deck)
  }

  func shuffle() {
    if (order.count == 0) {
      for i in 0...(deck.count-1) {
        order.append(i);
      }
    }
    order.shuffle()
  }

  func hasNextCard() -> Bool {
    return index < deck.count;
  }

  func currentCard() -> Card {
    if (index == 0) {
      return Card();
    }
    if (order.count == 0) {
      return deck[index-1];
    }
    return deck[order[index-1]]
  }

  func nextCard() -> Card {
    if self.hasNextCard() {
      index += 1;
    }
    if (order.count == 0) {
      return deck[index-1];
    }
    return deck[order[index-1]];
  }

  func undrawCard() {
    // Taken from the extension where we shuffle. Shuffle one card back into the deck
    let j = Int(arc4random_uniform(UInt32(order.count - index))) + index
    guard index != j else { return }
    swap(&order[index], &order[j])
    
    index -= 1 // go back one index
  }
  
  
  
}
