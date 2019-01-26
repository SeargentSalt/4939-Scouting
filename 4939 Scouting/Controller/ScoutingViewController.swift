//
//  ScoutingViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2018-12-26.
//  Copyright © 2018 4939. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ScoutingViewController: UIViewController {
    
    var scoutingData: ScoutingInfo?
    
    @IBOutlet weak var schoolTextFeild: UITextField!
    @IBAction func submitButton(_ sender: Any) {
        ref = Database.database().reference()
        
        if (schoolTextFeild.text != "") {
            ref?.child("list").childByAutoId().setValue(schoolTextFeild.text)
            schoolTextFeild.text = ""
        }
        
    }
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scoutingData!)
    }
}
