//
//  ViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2018-12-26.
//  Copyright © 2018 4939. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func scoutingButton(_ sender: Any) {
        performSegue(withIdentifier: "Scouting", sender: self)
    }
    
    @IBAction func ranksButton(_ sender: Any) {
    performSegue(withIdentifier: "Ranks", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

