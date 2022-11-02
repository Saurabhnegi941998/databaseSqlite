//
//  AViewController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 18/10/22.
//

import UIKit


class AViewController: UIViewController {
    var changeColor : (()-> Void)?
    @IBOutlet weak var updateTextField: UITextField!
    func changeColor(_ changeColor: String) {
        if changeColor=="red"{
            self.view.backgroundColor = UIColor.red
        }
        else{
            self.view.backgroundColor = UIColor.black
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    

    @IBAction func update(_ sender: UIButton) {
        let db = DBAHelper()
        db.update(url: updateTextField.text!)
        
        
    }
    @IBAction func jumpoNext(_ sender: Any) {
        
        guard let quotesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BVC") as? BViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        quotesViewController.modalPresentationStyle = .fullScreen
        quotesViewController.delegate = self
        // Push Quotes View Controller Onto Navigation Stack
        self.present(quotesViewController, animated: true, completion: nil)

  
        
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
