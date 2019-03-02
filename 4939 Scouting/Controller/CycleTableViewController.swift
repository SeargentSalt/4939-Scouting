//
//  CycleTableViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-02-23.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class CycleTableViewController: UITableViewController {
    
    //All IBOutlets
    @IBAction func endCycleButton(_ sender: Any) {
        stopWatch.invalidate()
        currentCycleInfo = getCycleInfo(info: currentCycleInfo)
    }
    @IBAction func startTimerButton(_ sender: Any) {
        stopWatch = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerFire), userInfo: nil, repeats: true)
    }
    @IBOutlet weak var timerLabel: UILabel!
 
    @IBOutlet weak var payloadTypeSegmented: UISegmentedControl!
    
    @IBOutlet weak var locationSegmented: UISegmentedControl!
    
    @IBOutlet var cycleSwitches: [UISwitch]!
    
    var stopWatch = Timer()
    var currentCycleInfo: CycleInfo = CycleInfo(hatch: false, cargo: false, cargoShip: false, rocketShip: false, levelOne: false, levelTwo: false, levelThree: false, successful: false, time: 0)
    var scoutingData: ScoutingInfo = ScoutingInfo(event: "", teamName: "")
    var cycles: [CycleInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationSegmented.addTarget(self, action: #selector(locationChange), for: UIControl.Event.valueChanged)
    }
    
    @objc func onTimerFire() {
        timerLabel.text = String(Int(timerLabel.text!)! + 1)
    }
    
    func getCycleInfo(info: CycleInfo) -> CycleInfo {
        info.time = Int(timerLabel.text!)!
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
            if(cycleSwitches[0].isOn) {
                info.levelOne = true
            }
            if(cycleSwitches[1].isOn) {
                info.levelTwo = true
            }
            if(cycleSwitches[2].isOn) {
                info.levelThree = true
            }
        }
        if(cycleSwitches[3].isOn) {
            info.successful = true
        }
        return info
    }
    
    @objc func locationChange() {
        if(locationSegmented.selectedSegmentIndex == 1) {
            for i in 0...2 {
                cycleSwitches[i].isEnabled = true
            }
        }
        else {
            for i in 0...2 {
                cycleSwitches[i].isEnabled = false
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MatchPreformanceTableViewController {
            destination.cycles = cycles
            destination.cycles.append(currentCycleInfo)
            destination.scoutingData.teamName = scoutingData.teamName
            destination.scoutingData.event = scoutingData.event
            destination.numberOfCyclesLabel.text = "# of Cycles: " + String(destination.cycles.count)
        }
    }
    

}
