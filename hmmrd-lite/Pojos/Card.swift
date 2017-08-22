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

  fileprivate(set) var rank:Int = 0

  fileprivate(set) var suit:Suit = Suit.invalid
  fileprivate(set) var name:String = ""
  fileprivate(set) var description:String = ""
  fileprivate(set) var teammateCount: Int = 0
  fileprivate(set) var opponentCount: Int = 0
  fileprivate(set) var drinkCard:Bool = true
  fileprivate(set) var triviaCategory:String = ""

  convenience init () {
    self.init(suit: .invalid, rank: -1)
  }

  convenience init (suit:Suit, rank:Int) {
    self.init(suit: suit, rank: rank, name: "", description: "", teammateCount: 0, opponentCount: 0, triviaCategory: "")
  }

  convenience init (suit:Suit, rank:Int, name: String, description:String, teammateCount: Int, opponentCount: Int) {
    // if it's trivia, the name will be "trivia: <category>"
    var triviaCategory: String = ""
    if (name.range(of:"trivia: ") != nil) {
      let index = name.index(name.startIndex,
                             offsetBy: "trivia: "
                              .characters.count)
      triviaCategory = name.substring(from: index)
    }

    self.init(suit: suit, rank: rank, name: name, description: description,teammateCount: teammateCount, opponentCount: opponentCount, triviaCategory: triviaCategory)
  }


  init (suit:Suit, rank:Int, name: String, description:String, teammateCount: Int, opponentCount: Int, triviaCategory:String) {
    self.suit = suit
    self.rank = rank
    self.name = name
    self.description = description
    self.teammateCount = teammateCount
    self.opponentCount = opponentCount
    self.triviaCategory = triviaCategory
  }

  func toString() -> String {
    return "\(self.suit.name()) #\(self.rank): \(name)\n\nteammates:\n\(teammateCount)\nteammates:\n\(opponentCount)\n\ndescription:\n\(description)"
  }
}

//Equatable
func ==(lhs:Card, rhs:Card) -> Bool {
  return lhs.rank == rhs.rank && lhs.suit == rhs.suit
}
