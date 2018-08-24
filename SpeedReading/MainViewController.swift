//
//  MainViewController.swift
//  speedReadMainView
//
//  Created by Kit Clark-O'Neil on 2018-08-22.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var currentMaterial:Array <ReadingMaterial> = []
    @IBOutlet weak var ReadingMaterialTableView: UITableView!
    @IBOutlet weak var YourLibraryLabel: UILabel!
    @IBOutlet weak var SettingsButton: UIButton!
    @IBOutlet weak var AddTextButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.currentMaterial = [ReadingMaterial]()
        self.YourLibraryLabel.text = "Your Library"
        self.ReadingMaterialTableView.delegate = self
        self.ReadingMaterialTableView.dataSource = self
        
        //Sample material
        
        let essay = ReadingMaterial.init(title: "myEssay", body: "asdkfja;lskjdf;lakjsd;lkfja;slkd")
        self.currentMaterial.append(essay)
        
        let coolStory = ReadingMaterial.init(title: "thatsAStory", body: "whooooo")
        self.currentMaterial.append(coolStory)
        
        let bennetsStory = ReadingMaterial.init(title: "BennetsLife", body: "amazing")
        self.currentMaterial.append(bennetsStory)
        
        let kitsStory = ReadingMaterial.init(title: "KitsLife", body: "prettyCool")
        self.currentMaterial.append(kitsStory)
        
        
        // Do any additional setup after loading the view.
    
   
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        let cell:MainTableViewCell = self.ReadingMaterialTableView.dequeueReusableCell(withIdentifier: "mainReuseCell", for: cellForRowAt) as! MainTableViewCell
        let material = self.currentMaterial[cellForRowAt.row]
        cell.TitleLabel.text = material.title
        
       let creationDate = DateFormatter ()
        creationDate.dateStyle = .medium
        
        let formattedDate = creationDate.string(from: material.createdDate)
        cell.DateLabel.text = formattedDate
        return cell
        
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.currentMaterial.count
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
