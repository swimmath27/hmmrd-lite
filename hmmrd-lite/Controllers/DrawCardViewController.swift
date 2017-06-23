//
//  DrawCardViewController.swift
//  hmmrd-lite
//
//  Created by Michael Lombardo on 6/23/17.
//  Copyright © 2017 hmmrd. All rights reserved.
//

import UIKit

class DrawCardViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
    if let ident = identifier {
      if ident == "DrawCardToInstructions" {
        if (!Deck.singleton.hasNextCard()) {
          alert("Out of cards");
          return false
        }
      }
    }
    return true
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

  func alert(_ s : String) {
    let popup = UIAlertController(title: "Error",
                                  message: s,
                                  preferredStyle: UIAlertControllerStyle.alert)

    let cancelAction = UIAlertAction(title: "OK",
                                     style: .cancel, handler: nil)

    popup.addAction(cancelAction)
    self.present(popup, animated: true,
                 completion: nil)
    
  }

}
