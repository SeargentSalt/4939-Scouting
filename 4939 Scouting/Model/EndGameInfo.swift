//
//  endGameInfo.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-02-25.
//  Copyright © 2019 4939. All rights reserved.
//

import Foundation

class EndGameInfo {
    var timeStopped: Int32
    var robotTip: Bool
    var robotRecover: Bool
    
    init(timeStopped: Int32, robotTip: Bool, robotRecover: Bool) {
        self.timeStopped = timeStopped
        self.robotTip = robotTip
        self.robotRecover = robotRecover
    }
}
