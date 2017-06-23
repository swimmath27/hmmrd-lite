//
//  RewardViewController.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/23/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController {
  static var success: Bool = false;

  @IBOutlet weak var rewardLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let card: Card = Deck.singleton.currentCard()

    rewardLabel.text = RewardViewController.success ? card.successMessage : card.failureMessage

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
