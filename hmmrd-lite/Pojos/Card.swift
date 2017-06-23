//
//  Card.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/21/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import Foundation

class Card : Equatable {
  enum Suit: Int {
    case invalid = 0 // 1 starts the actual types
    case head, muscle, moxie, random, drink

    func name() -> String {
      switch self {
      case .invalid:
        return "invalid"
      case .head:
        return "head"
      case .muscle:
        return "muscle"
      case .moxie:
        return "moxie"
      case .random:
        return "random"
      case .drink:
        return "drink"
      }
    }
  }

  fileprivate(set) var rank:Int = 0;

  fileprivate(set) var suit:Suit = Suit.invalid;
  fileprivate(set) var name:String = "";
  fileprivate(set) var instructions:String = "";
  fileprivate(set) var description:String = "";
  fileprivate(set) var successMessage:String = "";
  fileprivate(set) var failureMessage:String = "";

  convenience init () {
    self.init(suit: .invalid, rank: -1);
  }

  convenience init (suit:Suit, rank:Int) {
    self.init(suit: suit, rank: rank, name: "", instructions: "", description: "", successMessage: "", failureMessage: "");
  }


  init (suit:Suit, rank:Int, name: String, instructions:String, description:String, successMessage:String, failureMessage:String) {
    self.suit = suit;
    self.rank = rank;
    self.name = name;
    self.instructions = instructions;
    self.description = description;
    self.successMessage = successMessage;
    self.failureMessage = failureMessage;
  }

  func toString() -> String {
    return "\(self.suit.name()) #\(self.rank): \(name)\n\ninstructions:\n\(instructions)\n\ndescription:\n\(description)"
  }
}

//Equatable
func ==(lhs:Card, rhs:Card) -> Bool {
  return lhs.rank == rhs.rank && lhs.suit == rhs.suit
}
