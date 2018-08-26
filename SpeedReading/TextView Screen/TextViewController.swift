//
//  TextViewController.swift
//  SpeedReading
//
//  Created by Kit Clark-O'Neil on 2018-08-23.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
  var currentText = ReadingMaterial()
  var commonWordFilter = [String]()
  
  @IBOutlet weak var PlayButtonSegueController: UIButton!
  @IBOutlet weak var TextTitleLabel: UILabel!
  @IBOutlet weak var TextBodyView: UITextView!
  @IBOutlet weak var FilterSlider: UISlider!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        self.TextTitleLabel.text = self.currentText.title
        let filterWords = CommonWords()
        self.commonWordFilter = filterWords.commonWords as! [String]
      
        
        self.FilterSlider.maximumValue = Float(self.commonWordFilter.count)
        self.FilterSlider.minimumValue = 0
        TextBodyView.attributedText = self.filterWords()
        
    }
  
  override func viewDidAppear(_ animated: Bool) {
    TextBodyView.attributedText = self.filterWords()
  }

  
    func adjustFilter() -> [String] {
        var outputArray = [String]()
        let J:Int = Int(FilterSlider.value)
        for i in 0..<J {
            outputArray.append(self.commonWordFilter[i])
        }
        return outputArray
    }

  func filterWords() -> NSMutableAttributedString {
        let filter = adjustFilter()
    
        var highlighted = false
        var newPositionIndex = 0
    
        let bodyText = NSMutableAttributedString()
        for (i, word) in currentText.wordArray.enumerated() {
          
          if !filter.contains(word){
            newPositionIndex += 1
            
            if i >= currentText.currentPosition && !highlighted {
    
                let myAttribute = [NSAttributedStringKey.backgroundColor: UIColor.yellow]
                let highlightedWord = NSAttributedString (string: word, attributes: myAttribute)
                bodyText.append(highlightedWord)
                highlighted = true
                currentText.setNewCurrentPostion(newPosition: newPositionIndex)
            }
            else {
              let attributedWord = NSAttributedString (string: (word))
              bodyText.append(attributedWord)
            }
            bodyText.append(NSAttributedString (string: " "))
          }
        }
  
        return bodyText
    }

  // Mark: IBActions
  
  @IBAction func AdjustSlide(_ sender: UISlider) {

    self.TextBodyView.attributedText = filterWords()
  }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ReadingViewSegue"{
            let destinationVC = segue.destination as? ViewController
            
            guard let newController = destinationVC else {
                return
            }
           
            newController.readingMaterial = self.currentText
        }
    }
    


}
