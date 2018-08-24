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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Testing information
        
//        let TestKeyWords = CommonWords()
//        self.currentText.wordArray = TestKeyWords.testInput as! [String]
        //Remove when ReadingMaterial object is available
        
        
        
        
      
        
        self.TextTitleLabel.text = self.currentText.title
        let filterWords = CommonWords()
        self.commonWordFilter = filterWords.commonWords as! [String]
        
        self.TextBodyView.text = self.currentText.body
        self.FilterSlider.maximumValue = Float(self.commonWordFilter.count)
        self.FilterSlider.minimumValue = 0
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var PlayButtonSegueController: UIButton!
    @IBOutlet weak var TextTitleLabel: UILabel!
    @IBOutlet weak var TextBodyView: UITextView!
    @IBOutlet weak var FilterSlider: UISlider!
    
    
    func adjustFilter(sliderValue: Float) -> Array<String> {
        var outputArray = [String]()
        let J:Int = Int(sliderValue)
        for i in 0..<J {
            outputArray.append(self.commonWordFilter[i])
        }
        return outputArray
    }

    @IBAction func AdjustSlide(_ sender: UISlider) {
        let adjustedFilter:Array = adjustFilter (sliderValue: FilterSlider.value)
        let outputArray = filterWords(arrayA: self.currentText.wordArray, arrayB: adjustedFilter)
        self.TextBodyView.text = outputArray.joined(separator: " ")
    }
    
    func filterWords(arrayA: Array<String>, arrayB: Array<String>) -> Array<String> {
        var outputArray = [String]()
        var shouldAdd:Bool = true
        for inputString in arrayA {
            shouldAdd = true
            for filterString in arrayB {
                if (inputString == filterString) {
                    shouldAdd = false
                    break
                }
            }
            if shouldAdd == true {
                outputArray.append(inputString)
            }
        }
        
        return outputArray
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
