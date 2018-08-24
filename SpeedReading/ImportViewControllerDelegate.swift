//
//  ImportViewControllerDelegate.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-23.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation

protocol ImportViewControllerDelegate{
    func saveReadingMaterial(_: ImportViewController, reading: ReadingMaterial)
    
}
