//
//  ChooseModeViewController.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 10/10/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import UIKit

class ChooseModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "StartHouseModeSegue") {
        Deck.singleton.setUpHouseMode();
      } else if (segue.identifier == "StartBarModeSegue") {
        Deck.singleton.setUpBarMode();
      }
    }


}
