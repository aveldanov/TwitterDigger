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

  let keys = Keys()
  
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
    

    // Reference to all parameters
//    swifter.searchTweet(using: <#T##String#>, geocode: <#T##String?#>, lang: <#T##String?#>, locale: <#T##String?#>, resultType: <#T##String?#>, count: <#T##Int?#>, until: <#T##String?#>, sinceID: <#T##String?#>, maxID: <#T##String?#>, includeEntities: <#T##Bool?#>, callback: <#T##String?#>, tweetMode: <#T##TweetMode#>, success: <#T##Swifter.SearchResultHandler?##Swifter.SearchResultHandler?##(JSON, JSON) -> Void#>, failure: <#T##Swifter.FailureHandler##Swifter.FailureHandler##(Error) -> Void#>)
  }

  
  
  
  @IBAction func predictPressed(_ sender: UIButton) {
  }
  
  
}

