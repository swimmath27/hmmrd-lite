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

class Trivia {
  fileprivate(set) static var singleton: Trivia = Trivia()

  fileprivate var categoryQuestions: Dictionary<String, [TriviaQuestion]> = Dictionary<String, [TriviaQuestion]>()

  fileprivate var ref: DatabaseReference!

  // Called from AppDelegate after firebase is configured.
  func load() {
    self.getQuestionsFromFirebase()
  }

  fileprivate func getQuestionsFromFirebase(){
    self.ref = Database.database().reference()
    // load once - don't bother updating during the game.
    self.ref.child("Trivia").observeSingleEvent(of: .value, with: { (snapshot) in
      self.loadQuestionsFIR(snapshot: snapshot)
    }) { (error) in
      print(error.localizedDescription)
    }
  }

  fileprivate func loadQuestionsFIR(snapshot: DataSnapshot) {
    objc_sync_enter(categoryQuestions)

    let categories = snapshot.value as! Dictionary<String, Any>
    for (category, questionObjs) in categories {
      var tqs: [TriviaQuestion] = [TriviaQuestion]()
      let questions = questionObjs as! Array<Dictionary<String, Any>>

      for question in questions {
        let q = question["Question"] as! String
        var a: [String] = [String]()
        if let answers = question["Answer"] as? Array<String> {
          a = answers
        }
        let tq = TriviaQuestion(question: q, answers: a)
        tqs.append(tq)
      }
      categoryQuestions[category.lowercased()] = tqs
    }
    objc_sync_exit(categoryQuestions)
  }

  func getQuestion(category: String) -> TriviaQuestion {
    print("cat: \(category)");
    if let questions = categoryQuestions[category.lowercased()] {
      return questions[Int(arc4random_uniform(UInt32(questions.count)))]
    }
    return TriviaQuestion();
  }
}
