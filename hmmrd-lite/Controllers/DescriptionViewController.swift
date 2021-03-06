//
//  DescriptionViewController.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/23/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
  @IBOutlet weak var nextButton: UIButton!

  @IBOutlet weak var suitLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  var card: Card!

  override func viewDidLoad() {
    super.viewDidLoad()

    card = Deck.singleton.currentCard()

    suitLabel.text = card.suit.name()
    nameLabel.text = card.name
    descriptionLabel.text = card.description

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func NextButtonPressed(_ sender: Any) {
    if (card.triviaCategory != "") {
      performSegue(withIdentifier: "DescriptionToTrivia", sender: nil)
    }
    performSegue(withIdentifier: "DescriptionToInstructions", sender: nil)
  }


//  // MARK: - Navigation
//
//  // In a storyboard-based application, you will often want to do a little preparation before navigation
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//  }

}
