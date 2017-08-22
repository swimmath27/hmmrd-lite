//
//  DescriptionViewController.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/23/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!

  var triviaCategory: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()

    triviaCategory = Deck.singleton.currentCard().triviaCategory
//    if (triviaCategory == "") {
//      // problem
//      performSegue(withIdentifier: "TriviaToInstructions", sender: nil)
//    }

    categoryLabel.text = triviaCategory

    let tq: TriviaQuestion = Trivia.singleton.getQuestion(category: triviaCategory)

    questionLabel.text = tq.question

    
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func NextButtonPressed(_ sender: Any) {

  }


//  // MARK: - Navigation
//
//  // In a storyboard-based application, you will often want to do a little preparation before navigation
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//  }

}
