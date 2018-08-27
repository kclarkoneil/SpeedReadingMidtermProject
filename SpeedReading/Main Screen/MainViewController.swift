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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    ReadingMaterialTableView.reloadData()
  }
  
  func setupSampleData() {
    
    let reading1 = ReadingMaterial.init(title: "The Great Gatsby", body: "In my younger and more vulnerable years my father gave me some advice that Ive been turning over in my mind ever since. Whenever you feel like criticizing any one, he told me, just remember that all the people in this world haven’t had the advantages that you’ve had. He didnt say any more but weve always been unusually communicative in a reserved way, and I understood that he meant a great deal more than that. In consequence Im inclined to reserve all judgments, a habit that has opened up many curious natures to me and also made me the victim of not a few veteran bores. The abnormal mind is quick to detect and attach itself to this quality when it appears in a normal person, and so it came about that in college I was unjustly accused of being a politician, because I was privy to the secret griefs of wild, unknown men. Most of the confidences were unsought frequently I have feigned sleep, preoccupation, or a hostile levity when I realized by some unmistakable sign that an intimate revelation was quivering on the horizon for the intimate revelations of young men or at least the terms in which they express them are usually plagiaristic and marred by obvious suppressions. Reserving judgments is a matter of infinite hope. I am still a little afraid of missing something if I forget that, as my father snobbishly suggested, and I snobbishly repeat a sense of the fundamental decencies is parcelled out unequally at birth. And, after boasting this way of my tolerance, I come to the admission that it has a limit. Conduct may be founded on the hard rock or the wet marshes but after a certain point I don’t care what it’s founded on. When I came back from the East last autumn I felt that I wanted the world to be in uniform and at a sort of moral attention forever; I wanted no more riotous excursions with privileged glimpses into the human heart. Only Gatsby, the man who gives his name to this book, was exempt from my reaction Gatsby who represented everything for which I have an unaffected scorn. If personality is an unbroken series of successful gestures, then there was something gorgeous about him, some heightened sensitivity to the promises of life, as if he were related to one of those intricate machines that register earthquakes ten thousand miles away. This responsiveness had nothing to do with that flabby impressionability which is dignified under the name of the creative temperament it was an extraordinary gift for hope, a romantic readiness such as I have never found in any other person and which it is not likely I shall ever find again. N Gatsby turned out all right at the end it is what preyed on Gatsby, what foul dust floated in the wake of his dreams that temporarily closed out my interest in the abortive")
    self.currentMaterial.append(reading1)
    
    let reading2 = ReadingMaterial.init(title: "The Scarlet Letter", body: "It is a little remarkable, that—though disinclined to talk overmuch of myself and my affairs at the fireside, and to my personal friends—an autobiographical impulse should twice in my life have taken possession of me, in addressing the public. The first time was three or four years since, when I favored the reader—inexcusably, and for no earthly reason, that either the indulgent reader or the intrusive author could imagine—with a description of my way of life in the deep quietude of an Old Manse. It will be seen, likewise, that this Custom-House sketch has a certain propriety, of a kind always recognized in literature, as explaining how a large portion of the following pages came into my possession, and as offering proofs of the authenticity of a narrative therein contained. This, in fact,—a desire to put myself in my true position as editor, or very little more, of the most prolix among the tales that make up my volume,—this, and no other, is my true reason for assuming a personal relation with the public. In accomplishing the main purpose, it has appeared allowable, by a few extra touches, to give a faint representation of a mode of life not heretofore described, together with some of the characters that move in it, among whom the author happened to make one. In my native town of Salem, at the head of what, half a century ago, in the days of old King Derby, was a bustling wharf,—but which is now burdened with decayed wooden warehouses, and exhibits few or no symptoms of commercial life; except, perhaps, a bark or brig, half-way down its melancholy length, discharging hides; or, nearer at hand, a Nova Scotia schooner, pitching out her cargo of firewood,—at the head, I say, of this dilapidated wharf, which the tide often overflows, and along which, at the base and in the rear of the row of buildings, the track of many languid years is seen in a border of unthrifty grass,—here, with a view from its front windows adown this not very enlivening prospect, and thence across the harbor, stands a spacious edifice of brick. From the loftiest point of its roof, during precisely three and a half hours of each forenoon, floats or droops, in breeze or calm, the banner of the republic; but with the thirteen stripes turned vertically, instead of horizontally, and thus indicating that a civil, and not a military post of Uncle Sams government is here established. Its front is ornamented with a portico of half a dozen wooden pillars, supporting a balcony, beneath which a flight of wide granite steps descends towards the street. Over the entrance hovers an enormous specimen of the American eagle, with outspread wings, a shield")
    self.currentMaterial.append(reading2)
    
    let reading3 = ReadingMaterial.init(title: "To Kill a Mockingbird", body: "When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow. When it healed, and Jems fears of never being able to play football were assuaged, he was seldom self-conscious about his injury. His left arm was somewhat shorter than his right; when he stood or walked, the back of his hand was at right angles to his body, his thumb parallel to his thigh. He couldn’t have cared less, so long as he could pass and punt. Were southerners. We think its a big deal who your family is, where you’ve come from, and what you’re known for. Our ancestor, Simon Finch, was a stingy and religious man. He saved up all his money to buy up Finch’s Landing, and for generations thats where our family has lived. My Aunt Alexandra still lives here now with her quiet husband. My father Atticus Finch, went to Montgomery, Alabama to study law, and his brother Jack went to Boston to study to be a doctor. My father moved back to Maycomb once he finished law school. Maycomb was a tired, old town back in those days. People moved slowly, ambling across the town square. Days seemed long, especially on hot summer days. People didn’t hurry, because there was nowhere to go, nothing to buy, no money to buy it with, and nothing to see. We lived on the main street, Atticus, Jem, and I. Our father played with us, read to us, and treated us fine. We had a cook too, Calpurnia. She was strict with me. She always asked me why I didn’t behave as well as Jem. But he was older anyhow. She always won our battles; my father always took her side. Our mother died of a heart attack when I was two so I didn’t remember her. Jem seemed to miss her though. One day during the summer when I was six and Jem was nine, we were playing in our neighborhood as usual. We heard something in Miss Rachel’s garden. We found a boy sitting looking at us. He said, Im Charles Baker Harris. I can read. So what? I said. Jem wanted to get a better look at him so he said, Why don’t you come over, Charles Baker Harris. Folks call me Dill,  he said, struggling to fit under the fence. Dill told us he was from Mississippi, but was spending the summer with his aunt Rachel. He had seen a bunch of movies")
    self.currentMaterial.append(reading3)
    
    let reading4 = ReadingMaterial.init(title: "Fahrenheit 451", body: "It was a pleasure to burn it was a special pleasure to see things eaten, to see things blackened and changed. With the brass nozzle in his fists, with this great python spitting its venomous kerosene upon the world, the blood pounded in his head, and his hands were the hands of some amazing conductor playing all the symphonies of blazing and burning to bring down the tatters and charcoal ruins of history. With his symbolic helmet numbered 451 on his stolid head, and his eyes all orange flame with the thought of what came next, he flicked the igniter and the house jumped up in a gorging fire that burned the evening sky red and yellow and black. He strode in a swarm of fireflies. He wanted above all, like the old joke, to shove a marshmallow on a stick in the furnace, while the flapping pigeon-winged books died on the porch and lawn of the house. While the books went up in sparkling whirls and blew away on a wind turned dark with burning.  It was a special pleasure to see things eaten, to see things blackened and changed. With the brass nozzle in his fists, with this great python spitting its venomous kerosene upon the world, the blood pounded in his head, and his hands were the hands of some amazing conductor playing all the symphonies of blazing and burning to bring down the tatters and charcoal ruins of history. With his symbolic helmet numbered 451 on his stolid head, and his eyes all orange flame with the thought of what came next, he flicked the igniter and the house jumped up in a gorging fire that burned the evening sky red and yellow and black. He strode in a swarm of fireflies. He wanted above all, like the old joke, to shove a marshmallow on a stick in the furnace, while the flapping pigeon-winged books died on the porch and lawn of the house. While the books went up in sparkling whirls and blew away on a wind turned dark with burning.Montag grinned the fierce grin of all men singed and driven back by flame. He knew that when he returned to the firehouse, he might wink at himself, a minstrel man, burnt-corked, in the mirror. Later, going to sleep, he would feel the fiery smile still gripped by his face muscles, in the dark. It never went away, that. smile, it never ever went away, as long as he remembered. He hung up his black-beetle-coloured helmet and shined it, he hung his flameproof jacket neatly; he showered luxuriously, and then, whistling, hands in pockets, walked across the upper floor of the fire station and fell down the hole. At the last moment, when disaster seemed positive, he pulled his hands from his pockets and broke his fall by grasping the golden pole. He slid to a squeaking halt, the heels one inch from the concrete floor downstairs. He walked out of the fire station and along the midnight street toward the subway where the silent, air-propelled train slid soundlessly down its lubricated flue in the earth and let him out with a great puff of warm air an to the cream-tiled escalator rising to the suburb. Whistling, he let the escalator waft him into the still night air. He walked toward the corner, thinking little at all about nothing in particular. Before he reached the corner, however, he slowed as if a wind had sprung up from nowhere, as if someone had called his name.  The last few nights he had had the most uncertain feelings about the sidewalk just around the corner here, moving in the starlight toward his house. He had felt that a moment before his making the turn, someone had been there. The air seemed charged with a special calm as if someone had waited there, quietly, and only a moment before he came, simply turned to a shadow and let him through. Perhaps his nose detected a faint perfume, perhaps the skin on the backs of his hands, on his face, felt the temperature rise at this one spot where a person's standing might raise the immediate atmosphere ten degrees for an instant. There was no understanding it. Each time he made the turn, he saw only the white, unused, buckling sidewalk, with perhaps, on one night, something vanishing swiftly across a lawn before he could focus his eyes or speak.But now, tonight, he slowed almost to a stop. His inner mind, reaching out to turn the corner for him, had heard the faintest whisper. Breathing? Or was the atmosphere compressed merely by someone standing very quietly there, waiting?  He turned the corner.  The autumn leaves blew over the moonlit pavement in such a way as to make the girl who was moving there seem fixed to a sliding walk, letting the motion of the wind and the leaves carry her forward. Her head was half bent to watch her shoes stir the circling leaves. Her face was slender and milk-white, and in it was a kind of gentle hunger that touched over everything with tireless curiosity. ")
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
