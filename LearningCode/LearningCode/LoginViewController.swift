//
//  LoginViewController.swift
//  LearningCode
//
//  Created by Saurabhnegi on 11/10/22.
//

import UIKit
import SQLite

class LoginViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var pswd: UITextField!
    @IBOutlet weak var userid: UITextField!
    @IBOutlet weak var url: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = DBAHelper()

}
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
       
    }
    @IBAction func loginBtn(_ sender: Any) {
        if((url.text == "") || (userid.text == nil) || (pswd.text == "")){
            let alert = UIAlertController(title: "My Alert", message: "TextField cant be blank.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let db  = DBAHelper()
            db.insert(url: url.text!, username: userid.text!, pswd: pswd.text!)
           let data =  db.readData()
            var i = 0
            while(data.count != i){
                print(data[i].url)
                i = i + 1
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AVC")
        self.navigationController?.pushViewController(vc, animated: true)
        
        
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
