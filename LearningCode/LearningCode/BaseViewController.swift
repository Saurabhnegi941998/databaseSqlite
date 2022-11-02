//
//  BaseViewController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 07/10/22.
//

import Foundation
import UIKit
class BaseViewController : UIViewController
{
    func commonFunc(width:Int,height:Int)->(Int){
        
        return width * height;
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
