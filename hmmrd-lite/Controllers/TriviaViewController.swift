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
  @IBOutlet weak var answersLabel: UILabel!

  @IBOutlet weak var nextButton: UIButton!

  var triviaCategory: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    answersLabel.isHidden = true;

    triviaCategory = Deck.singleton.currentCard().triviaCategory
    if (triviaCategory == "") {
      // problem
      alertError("Error", msg: "An error has occurred with this trivia category", action: {
      action in self.performSegue(withIdentifier: "TriviaToInstructions", sender: nil)
    })
    }

    categoryLabel.text = triviaCategory

    let tq: TriviaQuestion = Trivia.singleton.getQuestion(category: triviaCategory)
    if (tq.isEmpty()) {
      // problem
      alertError("Error", msg: "An error has occurred with this trivia card", action: {
        action in self.performSegue(withIdentifier: "TriviaToInstructions", sender: nil)
      })
    }

    questionLabel.text = tq.question
    answersLabel.text = "\(tq.answers)"

    
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func NextButtonPressed(_ sender: Any) {
    if (answersLabel.isHidden) {
      // show the answers
      answersLabel.isHidden = false
      nextButton.setTitle("Go Back", for: UIControlState())
    } else {
      // this is after the answers have been viewed
      performSegue(withIdentifier: "TriviaToInstructions", sender: nil)
    }
  }


//  // MARK: - Navigation
//
//  // In a storyboard-based application, you will often want to do a little preparation before navigation
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//  }

  // this doesn't have a cancel option
  func alertError(_ title: String, msg : String, action : @escaping (UIAlertAction) -> Void) {
    let popup = UIAlertController(title: title,
                                  message: msg,
                                  preferredStyle: UIAlertControllerStyle.alert)

    let okAction = UIAlertAction(title:"OK", style: .default, handler: action);
    popup.addAction(okAction)

    self.present(popup, animated: true,
                 completion: nil)
  }


  func alertToConfirm(_ title: String, msg : String, action : @escaping (UIAlertAction) -> Void) {
    let popup = UIAlertController(title: title,
                                  message: msg,
                                  preferredStyle: UIAlertControllerStyle.alert)

    let okAction = UIAlertAction(title:"OK", style: .default, handler: action);
    popup.addAction(okAction)

    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    popup.addAction(cancelAction);

    self.present(popup, animated: true,
                 completion: nil)
  }
}
