//
//  ReadingMaterial.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-22.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit
import RealmSwift

class ReadingMaterial: Object {
  @objc dynamic var title: String = ""
  @objc dynamic var body: String = ""
  var wordArray: [String] = [String]()
  @objc dynamic var currentPosition: Int = 0
  @objc dynamic var createdDate: Date = Date()
  @objc dynamic var lastReadDate: Date? = nil
  
  convenience init(title: String, body: String) {
    self.init()
    self.title = title
    self.body = body
    self.createdDate = Date()
    rebuildWordArray()
  }
  
  
    func rebuildWordArray(){
        let filteredString = body.filterCharacters(inCharacterSet: CharacterSet.init(charactersIn: ".,-[]"))
        wordArray = filteredString.components(separatedBy: " ")
    }
    
    func getCurrentWord() -> String? {
        return wordArray[currentPosition]
    }
    
    func nextWord() -> () {
        
        if currentPosition >= wordArray.count - 1 {
            do {
                let realm = try Realm()
                try realm.write {
                    currentPosition = 0
                }
            }
            catch {
                print ("error encountered")
            }
            return
        }
        else {
            do {
                let realm = try Realm()
                try realm.write {
                    
                    currentPosition += 1
                    
                }
              try realm.write {
                
                lastReadDate = Date()
                
              }
            }
            catch{
                print("Error encountered")
            }
            return
        }
    }
    func setNewCurrentPostion(newPosition: Int) -> (){
        
        do {
            let realm = try Realm()
            try realm.write {
                currentPosition = newPosition
            }
        }
        catch {
            print("error")
        }
        return
    }
                
    
}

