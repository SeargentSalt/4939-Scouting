//
//  EventsCellController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-01.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {

    @IBOutlet weak var eventLabel: UILabel!
    
    func setEventLabel(event: String) {
        eventLabel.text = event
    }

}
