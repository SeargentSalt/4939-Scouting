//
//  MatchPreformanceTableViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-02.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class MatchPreformanceTableViewController: UITableViewController {
    
    //All IBOutlets
    @IBAction func unwindToMatchPreformance(_ sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func addCycleButton(_ sender: Any) {
        performSegue(withIdentifier: "AddCycle", sender: self)
    }

    @IBOutlet weak var beginningLocationSegmented: UISegmentedControl!
    
    @IBOutlet var sandstormSwitches: [UISwitch]!
    
    @IBOutlet weak var payloadTypeSegmented: UISegmentedControl!
    
    @IBOutlet weak var locationSegmented: UISegmentedControl!
    
    @IBOutlet var startingObjectSwitches: [UISwitch]!
    
    
    @IBOutlet weak var numberOfCyclesLabel: UILabel!
    
    @IBOutlet weak var endGameTimeStoppedStepper: UIStepper!
    
    @IBOutlet weak var timeStoppedLabel: UILabel!
    
    @IBOutlet var endGameSegmented: [UISegmentedControl]!
    
    
    @IBOutlet var capabilitiesSwitches: [UISwitch]!
    
    @IBOutlet var capabilitiesSegmentedControls: [UISegmentedControl]!
    
    @IBOutlet var readyToSubmitTextFeilds: [UITextField]!
    
    @IBAction func submitButton(_ sender: Any) {
        GetSendData.WriteData(event: scoutingData.event, team: scoutingData.teamName, beginningLocationInfo: getBeginningLocationInfo(info: beginningLocationInfo), sandstormInfo: getSandstormInfo(info: sandstormInfo), startingObjectInfo: getStartingObjectInfo(info: startingObject), cycleInfo: cycles, endGameInfo: getEndGameInfo(info: endGameInfo), capabilitiesInfo: getCapabilitiesInfo(info: capabilitiesInfo), submitInfo: getSubmitInfo(info: submitInfo))
    }
    
    var scoutingData: ScoutingInfo = ScoutingInfo(event: "", teamName: "")
    var cycles: [CycleInfo] = []
    var beginningLocationInfo: BeginningLocationInfo = BeginningLocationInfo(platformOne: false, platformTwo: false)
    var sandstormInfo: SandstormInfo = SandstormInfo(leftPlatform: false)
    var startingObject: CycleInfo = CycleInfo(hatch: false, cargo: false, cargoShip: false, rocketShip: false, levelOne: false, levelTwo: false, levelThree: false, successful: false, time: 0)
    //var startingObject: CycleInfo = CycleInfo(hatch: false, time: 0, cargo: false, cargoShip: false, rocketShip: false, levelOne: false, levelTwo: false, levelThree: false, successful: false)
    var endGameInfo: EndGameInfo = EndGameInfo(timeStopped: 0, robotTip: false, robotRecover: false)
    var capabilitiesInfo: CapabilitiesInfo = CapabilitiesInfo(cargoInCargoShip: false, cargoInRocketShip: false, hatchOnCargoShip: false, hatchOnRocketShip: false, climb: 0, speed: 0, driving: false)
    var submitInfo: SubmitInfo = SubmitInfo(matchNumber: "", scouterName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        print(scoutingData.teamName)
        print(scoutingData.event)
        locationSegmented.addTarget(self, action: #selector(locationChange), for: UIControl.Event.valueChanged)
        tap.cancelsTouchesInView = false 
        endGameTimeStoppedStepper.addTarget(self, action: #selector(StepperIncr), for: UIControl.Event.allTouchEvents)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CycleTableViewController {
            destination.scoutingData.event = scoutingData.event
            destination.scoutingData.teamName = scoutingData.teamName
            destination.cycles = cycles
        }
    }
    
    @objc func locationChange() {
        if(locationSegmented.selectedSegmentIndex == 1) {
            for i in 0...2 {
                startingObjectSwitches[i].isEnabled = true
            }
        }
        else {
            for i in 0...2 {
                startingObjectSwitches[i].isEnabled = false
            }
        }
    }
    
    @objc func StepperIncr() {
        timeStoppedLabel.text = String(Int32(endGameTimeStoppedStepper.value)) + " s"
    }
    
    func getBeginningLocationInfo(info: BeginningLocationInfo) -> BeginningLocationInfo{
        if(beginningLocationSegmented.selectedSegmentIndex == 0) {
            info.platformOne = true
        }
        else {
            info.platformTwo = true
        }
        return info
    }
    
    func getSandstormInfo(info: SandstormInfo) -> SandstormInfo {
        if(sandstormSwitches[0].isOn) {
            info.leftPlatform = true
        }
        return info
    }
    
    func getStartingObjectInfo(info: CycleInfo) -> CycleInfo {
        if(payloadTypeSegmented.selectedSegmentIndex == 0) {
            info.hatch = true
        }
        else {
            info.cargo = true
        }
        if(locationSegmented.selectedSegmentIndex == 0) {
            info.cargoShip = true
        }
        else {
            info.rocketShip = true
            if(startingObjectSwitches[0].isOn) {
                info.levelOne = true
            }
            if(startingObjectSwitches[1].isOn) {
                info.levelTwo = true
            }
            if(startingObjectSwitches[2].isOn) {
                info.levelThree = true
            }
        }
        if(startingObjectSwitches[3].isOn) {
            info.successful = true
        }
        return info
    }
    
    func getEndGameInfo(info: EndGameInfo) -> EndGameInfo {
        info.timeStopped = Int32(endGameTimeStoppedStepper.value)
        if(endGameSegmented[0].selectedSegmentIndex == 0) {
            info.robotTip = true
            
            if(endGameSegmented[1].selectedSegmentIndex == 0) {
                info.robotRecover = true
            }
        }
        return info
    }
    
    func getCapabilitiesInfo(info: CapabilitiesInfo) -> CapabilitiesInfo {
        if(capabilitiesSwitches[0].isOn) {
            info.cargoInCargoShip = true
        }
        if(capabilitiesSwitches[1].isOn) {
            info.cargoInRocketShip = true
        }
        if(capabilitiesSwitches[2].isOn) {
            info.hatchOnCargoShip = true
        }
        if(capabilitiesSwitches[3].isOn) {
            info.hatchOnRocketShip = true
        }
        info.climb = Int32(capabilitiesSegmentedControls[0].selectedSegmentIndex)
        info.speed = Int32(capabilitiesSegmentedControls[1].selectedSegmentIndex)
        if(capabilitiesSegmentedControls[2].selectedSegmentIndex == 1) {
            info.driving = true
        }
        return info
    }
    
    func getSubmitInfo(info: SubmitInfo) -> SubmitInfo {
        info.matchNumber = readyToSubmitTextFeilds[0].text!
        info.scouterName = readyToSubmitTextFeilds[1].text!
        return info
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
