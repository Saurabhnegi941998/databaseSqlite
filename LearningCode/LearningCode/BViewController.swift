//
//  BViewController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 18/10/22.
//

import UIKit

//protocol BVCdelegte:class{
//    func changeColor(_ changeColor:String)
//}
class BViewController: UIViewController{
    weak var delegate : AViewController?
    @IBOutlet weak var textbox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

 
    }
    
    @IBAction func changeColorBtn(_ sender: Any) {
        delegate?.changeColor("red")
        
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
