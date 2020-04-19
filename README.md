## PODs

* Swifter
* SwiftyJSON

## Tech
* CreateML
* CoreML


### How to create a Model using CreateML in MacOS Playground

```swift
import Cocoa
import CreateML




let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/aveldanov/Downloads/twitter-sanders-apple3.csv"))


let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)


let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")



let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")


let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100


let metaData = MLModelMetadata(author: "Anton Veldanov", shortDescription: "Twittter Sentiment", version: "1.0")


try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/aveldanov/Downloads/TweetSentimentClassifier.mlmodel"))


try sentimentClassifier.prediction(from: "@Apple is lovely, great and wonderful")

try sentimentClassifier.prediction(from: "I hate this restaraunt. Horrible food")

```
