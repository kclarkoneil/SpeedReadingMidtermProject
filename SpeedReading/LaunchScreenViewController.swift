//
//  LaunchScreenViewController.swift
//  
//
//  Created by Bennett on 2018-08-24.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
  @IBOutlet weak var launchLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        labelAnimation()
      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animate(withDuration: 5.0, animations: {
      self.launchLabel.alpha = 0.0
    })
  }
  
  func labelAnimation() {
    let animationView = LOTAnimationView(name: "color_line")
    animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    animationView.center = self.view.center
    animationView.contentMode = .scaleAspectFill
    
    view.addSubview(animationView)
    
    animationView.play()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
      self.launchLabel.text = "4"
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      self.launchLabel.text = "Speed"
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
      self.performSegue(withIdentifier: "segueToMainScreen", sender: nil)
    })
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
