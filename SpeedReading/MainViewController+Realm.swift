//
//  MainViewController+Realm.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-23.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation
import RealmSwift

extension MainViewController{
  
   func writeReadingMaterial(reading: ReadingMaterial){
    do {
      let realm = try Realm()
      try realm.write {
        realm.add(reading)
      }
    }
    catch{
      print("Error encountered")
    }
  }
  
  func deleteAll (){
    let realm = try! Realm()
    try! realm.write{
      realm.deleteAll()
    }
  }
  
  
  func deleteReadingMaterial (reading: ReadingMaterial){
    do{
      let realm = try Realm()
      let userObject = realm.objects(ReadingMaterial.self).filter("title = '\(reading.title)'").first!
      
      try! realm.write{
        // should delete the right list
        realm.delete(userObject)
      }
    }
    catch{
      print("Error encountered")
    }
  }
  
  
   func realmRead() -> [ReadingMaterial]?{
    guard let realm = try? Realm() else{
      print("Error in Reading")
      return nil
    }
    
    let resultsList = realm.objects(ReadingMaterial.self)
    
    var readingArray = [ReadingMaterial]()
    for reading in resultsList{
      reading.rebuildWordArray()
      readingArray.append(reading)
    }
    return readingArray
  }
  
  
}
