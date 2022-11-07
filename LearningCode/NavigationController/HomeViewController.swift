//
//  HomeViewController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 03/11/22.
//

import UIKit
extension UINavigationController {
  open override var shouldAutorotate: Bool {
    return true
  }
    
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return topViewController?.supportedInterfaceOrientations ?? .allButUpsideDown
  }
}


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        


    }
    
    
    @IBAction func JumpToNextView(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
    
    
}
