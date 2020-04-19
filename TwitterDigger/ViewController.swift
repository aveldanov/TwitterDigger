//
//  ViewController.swift
//  TwitterDigger
//
//  Created by Veldanov, Anton on 4/17/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {

  
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var sentimentLabel: UILabel!
  
  let swifter = Swifter(consumerKey: TWITTER_CONSUMER_KEY, consumerSecret: TWITTER_CONSUMER_SECRET)

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  
  
  @IBAction func predictPressed(_ sender: UIButton) {
  }
  
  
}

