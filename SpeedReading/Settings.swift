//
//  Settings.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-22.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation

struct Settings{
  var WPM:Int {
    set{
      let defaults = UserDefaults.standard
      defaults.set(newValue, forKey: "WPM")
    }
    get{
      let defaults = UserDefaults.standard
      defaults.register(defaults: ["WPM" : 100])
      return defaults.integer(forKey: "WPM")
    }
  }
  
}

