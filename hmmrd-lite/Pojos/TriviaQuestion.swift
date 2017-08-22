//
//  TriviaQuestion.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 8/21/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import Foundation

class TriviaQuestion: CustomStringConvertible {
  fileprivate(set) var question:String = ""
  fileprivate(set) var answers:[String] = [String]()


  convenience init() {
    self.init(question: "", answers: []);
  }


  init(question:String, answers:[String]) {
    self.question = question
    self.answers = answers
  }
  
  public var description: String {
    return "\n\(question)\n\(answers)\n"
  }
}
