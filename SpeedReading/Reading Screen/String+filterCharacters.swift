//
//  String+filterCharacters.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-22.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation

extension String {
  func filterCharacters(inCharacterSet forbiddenCharacters:CharacterSet) -> String
  {
    var filteredString = self
    while true {
      if let forbiddenCharRange = filteredString.rangeOfCharacter(from: forbiddenCharacters)  {
        filteredString.removeSubrange(forbiddenCharRange)
      }
      else {
        break
      }
    }
    
    return filteredString
  }
}
