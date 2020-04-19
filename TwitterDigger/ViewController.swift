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
  
  let tweetCount = 100
  
  let sentimentClassifier = TweetSentimentClassifier()
  
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var sentimentLabel: UILabel!
  
  
  var swifter: Swifter{
    return Swifter(consumerKey: keys.APIkey, consumerSecret: keys.APISecretKey)
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  
  
  
  @IBAction func predictPressed(_ sender: UIButton) {
    
    
    fetchTweets()
    
    
    
  }
  
  
  
  func fetchTweets(){
    
    
    if let searchText = textField.text{
      
      swifter.searchTweet(using: searchText, lang: "en", count: tweetCount, tweetMode: .extended, success: { (results, metadata) in
        //      print(results)
        
        var tweets = [TweetSentimentClassifierInput]()
        for i in 0..<self.tweetCount{
          if let tweet = results[i]["full_text"].string{
            
            //           print(tweet)
            let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
            tweets.append(tweetForClassification)
            
          }
          
        }
        
        // print(tweets)
        self.makePrediction(with: tweets)
        
        
        
      }) { (error) in
        print("Error with Twitter API request \(error)")
      }
      
      
      
      
      
      //    // check 1 tweet
      //    let predication = try! sentimentClassifier.prediction(text: "@Apple America love it best ever favorite")
      //
      //    print(predication.class_)
      
      
      
      
    }
    
    
    
    
    
    
  }
  
  
  func makePrediction(with tweets: [TweetSentimentClassifierInput]){
    
    do{
      
      let predicatons = try self.sentimentClassifier.predictions(inputs: tweets)
      
      var sentimentScore = 0
      
      for pred in predicatons{
        let sentiment = pred.label
        
        if sentiment == "Pos"{
          sentimentScore += 1
        }else if sentiment == "Neg"{
          sentimentScore -= 1
        }
        
      }
      
      //        predicatons.map{print($0.label)}
      
      updateUI(with: sentimentScore)
      
      
    }catch{
      print(error)
    }
    
  }
    
  func updateUI(with sentimentScore: Int ){
    
    print(sentimentScore)
    
    if sentimentScore > 20 {
      self.sentimentLabel.text = "😍"
    }
    else if sentimentScore > 10 {
      self.sentimentLabel.text = "😀"
    }
    else if sentimentScore > 10 {
      self.sentimentLabel.text = "🙂"
    }
    else if sentimentScore == 0 {
      self.sentimentLabel.text = "😐"
    }
    else if sentimentScore > -10 {
      self.sentimentLabel.text = "🙁"
    }
    else if sentimentScore > -20 {
      self.sentimentLabel.text = "😠"
    }else{
      self.sentimentLabel.text = "😡"
    }
    
    
    
    
  }
  
  
}

