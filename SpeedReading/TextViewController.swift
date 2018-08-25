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
        
        self.TextBodyView.text = self.currentText.body
        
        self.FilterSlider.maximumValue = Float(self.commonWordFilter.count)
        self.FilterSlider.minimumValue = 0

    }

  
    func adjustFilter(sliderValue: Float) -> Array<String> {
        var outputArray = [String]()
        let J:Int = Int(sliderValue)
        for i in 0..<J {
            outputArray.append(self.commonWordFilter[i])
        }
        return outputArray
    }

    func filterWords(arrayA: Array<String>, arrayB: Array<String>) -> Array<String> {
        var outputArray = [String]()
        var shouldAdd:Bool = true
        
        var newPositionIndex = self.currentText.currentPosition
        
        
        for inputString in arrayA {
            
            shouldAdd = true
            for filterString in arrayB {
                
                let currentWord = self.currentText.wordArray[newPositionIndex]
                
                if (inputString == filterString) {
                    shouldAdd = false
                    
                    if (inputString == currentWord) {
                       let oldPositionIndex = self.currentText.wordArray.index(of: currentWord)
                        guard let positionIndex = oldPositionIndex else {
                            break
                            }
                        
                        newPositionIndex = positionIndex - 1
                    
                    break
                }
            }
            if shouldAdd == true {
                outputArray.append(inputString)
            }
            
        }
    }
        self.currentText.currentPosition = newPositionIndex
        return outputArray
    }

  // Mark: IBActions
  
  @IBAction func AdjustSlide(_ sender: UISlider) {
    let adjustedFilter:Array = adjustFilter (sliderValue: FilterSlider.value)
    let outputArray = filterWords(arrayA: self.currentText.wordArray, arrayB: adjustedFilter)
    self.TextBodyView.text = outputArray.joined(separator: " ")
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
    
    func showCurrentPosition(regularWord: String) -> NSAttributedString {

        let accessibilityBackgroundColor: NSAttributedString.key
        let newWord = NSAttributedString.init(string: regularWord, attributes: attrs)
        
        return newWord
       [NSAttributedStringKey: Any] = [.font: UIFont(name: "AvenirNext-Medium", size: 12)!]
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
