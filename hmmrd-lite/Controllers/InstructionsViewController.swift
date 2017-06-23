//
//  InstructionsViewController.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/23/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

  @IBOutlet weak var instructionsLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    // This should be the only place where "nextCard" is called.
    let card:Card = Deck.singleton.nextCard();

    instructionsLabel.text = card.instructions


    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

}
