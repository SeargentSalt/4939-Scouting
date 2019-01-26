//
//  ScoutingInfo.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-02.
//  Copyright © 2019 4939. All rights reserved.
//

import Foundation

class ScoutingInfo {
    var event: String
    var teamName: String
    //ADD IN THE SCORING PARAMETERS
    
    init(event: String, teamName: String) {
        self.event = event
        self.teamName = teamName
    }
}
