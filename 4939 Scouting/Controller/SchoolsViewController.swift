//
//  SchoolsViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-01.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class SchoolsViewController: UIViewController {
    
    var selectedSchool: String = ""
    @IBOutlet weak var schoolsTabelView: UITableView!
    var scoutingdata: ScoutingInfo = ScoutingInfo(event: "", teamName: "")
    var teamsArray: [String] = []
    let durhamTeams: [String] = ["188 Blizzard", "610 Crescent Coyotes", "2200 MMRambotics", "2386 Trojans", "2708 Lake Effect Robotics", "2852 DM High Voltage", "2994 ASTECHZ", "3571 Mustang Robotics", "4015 Jag", "4152 Hoya Robotics", "4476 W.A.F.F.L.E.S.", "4519 King's Robotics", "4525 Renaissance Robotics", "4704 Northern Lights Robotics", "4783 RoboRavens", "4907 Thunderstamps", "4936 Viral Vortex", "4946 The Alpha Dogs", "4951 CDS Cyclones", "5036 The Robo Devils", "5409 Chargers", "5426 E.J. Lajeunesse", "5885 Villanova WiredCats", "6070 Gryphon Machine", "6110 Doc Botics", "6135 Arctos", "6514 Sutton Robotics League", "6859 BML Robotics", "6864 Gravenhurst High School", "6866 The Space Invaders", "6867 Panthera Tech", "6975 Neil McNeil Maroons", "6987 Falcon Automation", "7267 Lisgar Robotics Club", "7564 Lakers", "7614 NHS Raiders", "7690 Mustang Robotics", "7710 Mowat Mustangs", "7712 ACCN#2", "7735 Milliken Mills H.S."]
    
    let humberTeams: [String] = ["746 Gearheads", "771 SWAT", "854 Iron Bears", "865 WARP7", "907 East York Cybernetics 'The Cybernauts'", "1114 Simbotics", "1310 Runnymede Robotics", "1374 Amped Up", "2198 Paradigm Shift", "2405 Techno Trojans", "2935 NACI Robotics", "3683 Team Dave", "4039 MakeShift Robotics", "4308 ABSOLUTE ROBOTICS", "4343 MaxTech", "4939 Allspark9", "5031 Full Metal Mustangs", "5834 R3P2", "5870 League of Logic", "6009 CYBERHEART", "6141 Senator O'Connor College School", "6513 Wyvern Robotics", "6977 Cyber Squad", "6978 QuickStrike Niagara", "7013 ACCN Techtronix", "7480 Machine Mavericks", "7509 STEAMTeam Robotics", "7558 ALT+F4", "7603 Bill Hogarth Secondary School", "7623 Morebotics", "7723 Westgate Tigers", "7902 Markham FireBirds"]
    
    let ryersonTeams: [String] = ["188 Blizzard", "746 Gearheads", "919 Tiger Techs", "1246 Agincourt Skunkworks", "1285 The Big Bang", "1334 Red Devils", "2706 Merge Robotics", "4252 Cardinal Robotics", "4308 ABSOLUTE ROBOTICS", "4939 Allspark9", "5024 Raider Robotics", "5031 Full Metal Mustangs", "5036 The Robo Devils", "5039 Irish Iron", "5076 Richardson Stormbots", "5406 Celt-X", "5719 Pink Titans", "5821 The Saunders Robotics Club", "5911 PARAGON", "6162 Cap Alpaca", "6342 BT Robotics", "6397 Romero Robotics", "6866 The Space Invaders", "6867 Panthera Tech", "6878 SJB Odyssey", "7136 Thistletown Scot Bots", "7456 AUROBOTS", "7476 EOM Lions", "7520 Team MineKee", "7690 Mustang Robotics", "7710 Mowat Mustangs"]

    override func viewDidLoad() {
        super.viewDidLoad()
        schoolsTabelView.dataSource = self
        schoolsTabelView.delegate = self
        if(scoutingdata.event == "Durham College") {
            teamsArray = durhamTeams
        }
        else if(scoutingdata.event == "Humber College") {
            teamsArray = humberTeams
        }
        else if(scoutingdata.event == "Ryerson University") {
            teamsArray = ryersonTeams
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MatchPreformanceTableViewController {
            destination.scoutingData.event = self.scoutingdata.event
            destination.scoutingData.teamName = selectedSchool
        }
    }
}

extension SchoolsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let school = teamsArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolsCell") as! SchoolsCell
        cell.setSchoolLabel(school: school)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedSchool = teamsArray[indexPath.row]
        performSegue(withIdentifier: "SchoolCellSelected", sender: self)
    }
    
}
