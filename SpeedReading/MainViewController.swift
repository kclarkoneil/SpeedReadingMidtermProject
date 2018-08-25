//
//  MainViewController.swift
//  speedReadMainView
//
//  Created by Kit Clark-O'Neil on 2018-08-22.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ImportViewControllerDelegate {

  
    var currentMaterial:Array <ReadingMaterial> = []
    @IBOutlet weak var ReadingMaterialTableView: UITableView!
    @IBOutlet weak var YourLibraryLabel: UILabel!
    @IBOutlet weak var SettingsButton: UIButton!
    @IBOutlet weak var AddTextButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.currentMaterial = [ReadingMaterial]()
        self.ReadingMaterialTableView.delegate = self
        self.ReadingMaterialTableView.dataSource = self
      
      
        //Sample material
      if let tempArray = realmRead(), tempArray.count > 0{
        currentMaterial = tempArray
      }
      else{
        setupSampleData()
      }
        // Do any additional setup after loading the view.
    
    }
  
  
  func setupSampleData() {
    
    let reading1 = ReadingMaterial.init(title: "The Great Gatsby", body: "In my younger and more vulnerable years my father gave me some advice that Ive been turning over in my mind ever since. ")
    self.currentMaterial.append(reading1)
    
    let reading2 = ReadingMaterial.init(title: "The Scarlet Letter", body: "It is a little remarkable, that—though disinclined to talk overmuch of myself and my affairs at the fireside, and to my personal friends—an autobiographical impulse should twice in my life have taken possession of me, in addressing the public. The first time was three or four years since, when I favored the reader—inexcusably, and for no earthly reason, that either the indulgent reader or the intrusive author could imagine—with a description of my way of life in the deep quietude of an Old Manse.")
    self.currentMaterial.append(reading2)
    
    let reading3 = ReadingMaterial.init(title: "To Kill a Mockingbird", body: "When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow. When it healed, and Jems fears of never being able to play football were assuaged, he was seldom self-conscious about his injury. His left arm was somewhat shorter than his right; when he stood or walked, the back of his hand was at right angles to his body, his thumb parallel to his thigh. He couldn’t have cared less, so long as he could pass and punt.")
    self.currentMaterial.append(reading3)
    
    let reading4 = ReadingMaterial.init(title: "Fahrenheit 451", body: "It was a pleasure to burn it was a special pleasure to see things eaten, to see things blackened and changed. With the brass nozzle in his fists, with this great python spitting its venomous kerosene upon the world, the blood pounded in his head, and his hands were the hands of some amazing conductor playing all the symphonies of blazing and burning to bring down the tatters and charcoal ruins of history. With his symbolic helmet numbered 451 on his stolid head, and his eyes all orange flame with the thought of what came next, he flicked the igniter and the house jumped up in a gorging fire that burned the evening sky red and yellow and black. He strode in a swarm of fireflies. He wanted above all, like the old joke, to shove a marshmallow on a stick in the furnace, while the flapping pigeon-winged books died on the porch and lawn of the house. While the books went up in sparkling whirls and blew away on a wind turned dark with burning. ")
    self.currentMaterial.append(reading4)
    writeReadingMaterial(reading: reading1)
    writeReadingMaterial(reading: reading2)
    writeReadingMaterial(reading: reading3)
    writeReadingMaterial(reading: reading4)
    
  }
  
  // Mark: UITableDataSourceDelegate functions
    
    func tableView(_ tableView:UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        let cell:MainTableViewCell = self.ReadingMaterialTableView.dequeueReusableCell(withIdentifier: "mainReuseCell", for: cellForRowAt) as! MainTableViewCell
        let material = self.currentMaterial[cellForRowAt.row]
        cell.TitleLabel.text = material.title
        
       let dateFromatter = DateFormatter ()
        dateFromatter.dateStyle = .medium
      
        if let lastReadDate = material.lastReadDate{
          let formattedDate = dateFromatter.string(from: lastReadDate)
          cell.DateLabel.text = formattedDate
        }
        else{
          cell.DateLabel.text = ""
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.currentMaterial.count
    }

  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          let reading = self.currentMaterial[indexPath.row]
          deleteReadingMaterial(reading: reading)
          self.currentMaterial.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
      }
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "displayMaterialSegue"{
      let destinationVC = segue.destination as? TextViewController
      let index = self.ReadingMaterialTableView.indexPathForSelectedRow!
      guard let newController = destinationVC else {
        return
      }
      guard let displayMaterial = currentMaterial[index.row] as ReadingMaterial? else {
        return
      }
      newController.currentText = displayMaterial
    }
    else if segue.identifier == "segueImportReading"{
      guard let navController = segue.destination as? UINavigationController else{
        return
      }
      guard let importController = navController.viewControllers[0] as? ImportViewController else{
        return
      }
      importController.delegate = self
      
    }
  }

  
  // MARK: - ImportViewController Delegate functions
  
  func saveReadingMaterial(controller: ImportViewController, reading: ReadingMaterial) {
    
    //write to realm
    self.currentMaterial.append(reading)
    writeReadingMaterial(reading: reading)
    
    ReadingMaterialTableView.reloadData()
  }
  
  // Mark: IBAction functions
  
  @IBAction func sortByTitle(_ sender: Any) {
     currentMaterial = currentMaterial.sorted(by: { $0.title < $1.title })
    ReadingMaterialTableView.reloadData()
  }
  
  @IBAction func sortByLastRead(_ sender: Any) {
    currentMaterial = currentMaterial.sorted(by: {
      guard let lastReadDate0 = $0.lastReadDate, let lastReadDate1 = $1.lastReadDate else{
        return false
      }
      return lastReadDate0 < lastReadDate1 })
    ReadingMaterialTableView.reloadData()
  }
}
