//
//  CycleInfo.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-02-25.
//  Copyright © 2019 4939. All rights reserved.
//

import Foundation

class CycleInfo {
    var time: Int
    var hatch: Bool
    var cargo: Bool
    var cargoShip: Bool
    var rocketShip: Bool
    var levelOne: Bool
    var levelTwo: Bool
    var levelThree: Bool
    var successful: Bool
    
    init(hatch: Bool, cargo: Bool, cargoShip: Bool, rocketShip: Bool, levelOne: Bool, levelTwo: Bool, levelThree: Bool, successful: Bool, time: Int) {
        self.time = time
        self.hatch = hatch
        self.cargo = cargo
        self.cargoShip = cargoShip
        self.rocketShip = rocketShip
        self.levelOne = levelOne
        self.levelTwo = levelTwo
        self.levelThree = levelThree
        self.successful = successful
    }
}
