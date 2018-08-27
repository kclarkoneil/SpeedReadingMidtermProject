//
//  ImportViewController+TextFieldDelegate.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-23.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation
import UIKit
import Material

extension ImportViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      guard let textField = textField as? ErrorTextField else{
        return false
      }
      if textField.text == "" {
          textField.isErrorRevealed = true
      }
      else{
          textField.isErrorRevealed = false
      }
        return true
    }
}
