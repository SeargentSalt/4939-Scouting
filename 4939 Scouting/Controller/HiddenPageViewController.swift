//
//  HiddenPageViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-03.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HiddenPageViewController: UIViewController {

    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    var password: String = ""
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func submitButton(_ sender: Any) {
        if(passwordTextField.text == password){
            createAlert(title: "Update", message: "Would you like to tell everyone to update the app?")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref?.child("passwords").observe(.value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            self.password = (value["pass1"] as? String)!
        })
        /*
        ref?.child("passwords").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            self.password = (value["pass1"] as? String)!
        })
 */
        ref?.removeAllObservers()
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.ref?.child("latestVersion").setValue(currentVersionNumber + 1)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.ref?.child("latestVersion").setValue(currentVersionNumber)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
