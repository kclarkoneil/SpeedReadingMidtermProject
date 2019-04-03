//
//  ViewController.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-22.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var WPMSlider: UISlider!
    @IBOutlet weak var WPMDisplay: UILabel!
    
    var readingMaterial: ReadingMaterial?
    var settings = Settings()
    var reading = true
    var wordTimer: Timer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        reading = false
        self.WPMDisplay.text = "WPM: \(self.settings.WPM)"
    }
    
    func runTimer() {
        let interval = 60.0 / Double(settings.WPM)
        wordTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(forwardPressed), userInfo: nil, repeats: true)
    }
    
    @objc func updateWordLabel(){
        
        if let word = readingMaterial?.getCurrentWord() {
            DispatchQueue.main.async {
                self.wordLabel.text = word
            }
        }
        
    }
    
    @objc func forwardPressed() {
        readingMaterial?.nextWord()
        updateWordLabel()
    }
    
    @IBAction func handlePinch(_ recognizer: UIPinchGestureRecognizer) {
        
        let tempFontSize = wordLabel.fontSize * recognizer.scale
        
        guard tempFontSize > 12, tempFontSize < 100 else{
            return
        }
        
        wordLabel.fontSize = tempFontSize
        recognizer.scale = 1
    }
    
    @IBAction func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        reading = !reading
        if reading{
            runTimer()
            removeAnimate()
        }
        else{
            wordTimer?.invalidate()
            showAnimate()
        }
        
        
    }
    @IBAction func WPMSliderChanged(_ sender: Any) {
        self.settings.WPM = Int(WPMSlider.value)
        self.WPMDisplay.text = "WPM: \(self.settings.WPM)"
    }
    func showAnimate()
    {
        self.WPMSlider.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.WPMSlider.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.WPMSlider.alpha = 1.0
            self.WPMSlider.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
            self.WPMDisplay.alpha = 1.0
        })

    }
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.WPMSlider.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.WPMSlider.alpha = 0.0;
          self.WPMDisplay.alpha = 0.0;
        });

    }
}

