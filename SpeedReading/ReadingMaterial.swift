//
//  ReadingMaterial.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-22.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class ReadingMaterial: NSObject {
  var title: String
  var body: String
  var wordArray: [String] = [String]()
  var currentPosition: Int = 0
  var createdDate: Date
  var lastReadDate: Date?
  
  init(title: String, body: String) {
    self.title = title
    self.body = body
    self.createdDate = Date()
    wordArray = body.components(separatedBy: " ")
  }
  
  func getCurrentWord() -> String? {
    return wordArray[currentPosition]
  }
  
  func nextWord() -> () {
  
    guard currentPosition >= wordArray.count - 1 else {
      currentPosition += 1
      return
    }
    
    
  }
  
  func previousWord() -> () {
    
    guard currentPosition <= 0 else{
      currentPosition -= 1
      return
    }
  }
}
