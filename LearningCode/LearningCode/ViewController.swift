//
//  ViewController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 04/10/22.
//

import UIKit

class ViewController: BaseViewController{
    
    var length:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        length = super.commonFunc(width: 20, height: 50);
        print(length);
    }
    


}

