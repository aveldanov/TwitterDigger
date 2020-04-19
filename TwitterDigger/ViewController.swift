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
import SwiftyJSON

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
    
    swifter.searchTweet(using: "#blessed", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
      //      print(results)
      
      var tweets = [TwitterDiggerClassificationInput]()
      for i in 0..<100{
        if let tweet = results[i]["full_text"].string{
          
          //           print(tweet)
          let tweetForClassification = TwitterDiggerClassificationInput(text: tweet)
          tweets.append(tweetForClassification)
          
        }
        
      }
      
      // print(tweets)
      do{
        
       let predicatons = try self.sentimentClassifier.predictions(inputs: tweets)
       
        var sentimentScore = 0
        
        for pred in predicatons{
          let sentiment = pred.class_
          
          if sentiment == "Pos"{
            sentimentScore += 1
          }else if sentiment == "Neg"{
            sentimentScore -= 1
          }
          
        }
        
//        predicatons.map{print($0.class_)}
        
        print(sentimentScore)
      }catch{
        print(error)
      }
      
      
      
    }) { (error) in
      print("Error with Twitter API request \(error)")
    }
    
    
    
    
    
    //    // check 1 tweet
    //    let predication = try! sentimentClassifier.prediction(text: "@Apple America love it best ever favorite")
    //
    //    print(predication.class_)
    
  }
  
  
  
  
  @IBAction func predictPressed(_ sender: UIButton) {
  }
  
  
}

