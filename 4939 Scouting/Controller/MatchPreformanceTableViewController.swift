//
//  MatchPreformanceTableViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-02.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MatchPreformanceTableViewController: UITableViewController {

    var scoutingData: ScoutingInfo = ScoutingInfo(event: "", teamName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scoutingData.teamName)
        print(scoutingData.event)
        var ref: DatabaseReference?
        ref = Database.database().reference()
        ref?.child("list").childByAutoId().setValue("test3")
    }
}
