//
//  NavigationController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 07/11/22.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    override var shouldAutorotate: Bool {
      return false
    }
      
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
}
