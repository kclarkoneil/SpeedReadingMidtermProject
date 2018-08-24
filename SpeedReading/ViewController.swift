//
//  ViewController.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-22.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var backwardButton: UIButton!
  @IBOutlet weak var forwardButton: UIButton!
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var wordLabel: UILabel!
  
  var readingMaterial: ReadingMaterial?
  let settings = Settings()
  var reading = true
  var wordTimer: Timer?
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    //test data

    runTimer()
    
    readingMaterial = ReadingMaterial.init(title: "Test Book",
                                           body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
  }

  func runTimer() {
     let interval = 60.0 / Double(settings.WPM)
    print ("Interval is \(interval)")
     wordTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(forwardPressed(_:)), userInfo: nil, repeats: true)
  }
  
  @objc func updateWordLabel(){
    
    if let word = readingMaterial?.getCurrentWord() {
      DispatchQueue.main.async {
        self.wordLabel.text = word
      }
    }
  
  }
  
  @IBAction func forwardPressed(_ sender: Any) {
    readingMaterial?.nextWord()
    updateWordLabel()
  }
  
  @IBAction func backPressed(_ sender: Any) {
    readingMaterial?.previousWord()
    updateWordLabel()
  }
  
  
  @IBAction func playPausePressed(_ sender: Any) {
    reading = !reading
    if reading{
      runTimer()
      playButton.setTitle("Pause", for: .normal)
    }
    else{
      wordTimer?.invalidate()
      playButton.setTitle("Play", for: .normal)
    }
    forwardButton.isEnabled = !reading
    backwardButton.isEnabled = !reading
  }
  @IBAction func handlePinch(_ recognizer: UIPinchGestureRecognizer) {

      print ("\(recognizer.scale)")
      let tempFontSize = wordLabel.fontSize * recognizer.scale
      
      guard tempFontSize > 12, tempFontSize < 100 else{
        return
      }
      
      wordLabel.fontSize = tempFontSize
      recognizer.scale = 1
    
  }
}

