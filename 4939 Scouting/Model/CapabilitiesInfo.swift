//
//  CapabilitiesInfo.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-02-25.
//  Copyright © 2019 4939. All rights reserved.
//

import Foundation

class CapabilitiesInfo {
    var cargoInCargoShip: Bool
    var cargoInRocketShip: Bool
    var hatchOnCargoShip: Bool
    var hatchOnRocketShip: Bool
    var climb: Int32
    var speed: Int32
    var driving: Bool
    
    init(cargoInCargoShip: Bool, cargoInRocketShip: Bool, hatchOnCargoShip: Bool, hatchOnRocketShip: Bool, climb: Int32, speed: Int32, driving: Bool) {
        self.cargoInCargoShip = cargoInCargoShip
        self.cargoInRocketShip = cargoInRocketShip
        self.hatchOnCargoShip = hatchOnCargoShip
        self.hatchOnRocketShip = hatchOnRocketShip
        self.climb = climb
        self.speed = speed
        self.driving = driving
    }
}
