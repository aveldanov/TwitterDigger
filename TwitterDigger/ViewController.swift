//
//  ViewController.swift
//  TwitterDigger
//
//  Created by Veldanov, Anton on 4/17/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML

class ViewController: UIViewController {

  let keys = Keys()
  
  let sentimentClassifier = TwitterDiggerClassification()
  
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var sentimentLabel: UILabel!
  

  var swifter: Swifter{
    return Swifter(consumerKey: keys.APIkey, consumerSecret: keys.APISecretKey)
  }


  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
      print(results)
    }) { (error) in
      print("Error with Twitter API request \(error)")
    }
    
    
    try! sentimentClassifier.prediction(text: "@Apple is terrible")

  }

  
  
  
  @IBAction func predictPressed(_ sender: UIButton) {
  }
  
  
}

