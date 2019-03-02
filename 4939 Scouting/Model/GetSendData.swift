//
//  WriteData.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-02-25.
//  Copyright © 2019 4939. All rights reserved.
//

import Foundation
import FirebaseDatabase

class GetSendData {
    static func WriteData(event: String, team: String, beginningLocationInfo: BeginningLocationInfo, sandstormInfo: SandstormInfo, startingObjectInfo: CycleInfo, cycleInfo: [CycleInfo], endGameInfo: EndGameInfo, capabilitiesInfo: CapabilitiesInfo, submitInfo: SubmitInfo) {
        var ref: DatabaseReference?
        ref = Database.database().reference()
        ref?.child(event).child(team).setValue(["Scouter": submitInfo.scouterName, "Match Number": submitInfo.matchNumber])
        ref?.child(event).child(team).child("Beginning Info").setValue(["Platform One": beginningLocationInfo.platformOne, "Platform Two": beginningLocationInfo.platformTwo])
        ref?.child(event).child(team).child("Sandstorm Info").setValue(["Left Platform": sandstormInfo.leftPlatform])
        ref?.child(event).child(team).child("Starting Object Info").setValue(["Hatch": startingObjectInfo.hatch, "Cargo": startingObjectInfo.cargo, "Cargoship": startingObjectInfo.cargoShip, "Rocketship": startingObjectInfo.rocketShip, "Level 1": startingObjectInfo.levelOne, "Level 2": startingObjectInfo.levelTwo, "level 3": startingObjectInfo.levelThree, "Successful": startingObjectInfo.successful])
        if(cycleInfo.count > 0) {
            for i in 0...cycleInfo.count-1 {
                let child = "Cycle " + String(i + 1)
                ref?.child(event).child(team).child("Tele Ops Info").child(child).setValue(["Hatch": cycleInfo[i].hatch, "Cargo": cycleInfo[i].cargo, "Cargoship": cycleInfo[i].cargoShip, "Rocketship": cycleInfo[i].rocketShip, "Level 1": cycleInfo[i].levelOne, "Level 2": cycleInfo[i].levelTwo, "level 3": cycleInfo[i].levelThree, "Successful": cycleInfo[i].successful])
            }
        }
        ref?.child(event).child(team).child("End Game Info").setValue(["Time Stopped": endGameInfo.timeStopped, "Robot Tipped": endGameInfo.robotTip, "Robot Recovered": endGameInfo.robotRecover])
        ref?.child(event).child(team).child("Capabilities Info").setValue(["Cargo In Cargoship": capabilitiesInfo.cargoInCargoShip, "Cargo In Rocketship": capabilitiesInfo.cargoInRocketShip, "Hatch On Cargoship": capabilitiesInfo.hatchOnCargoShip, "Hatch On RocketShip": capabilitiesInfo.hatchOnRocketShip, "Climb": capabilitiesInfo.climb, "Speed": capabilitiesInfo.speed, "Driving": capabilitiesInfo.driving])
    }
}
