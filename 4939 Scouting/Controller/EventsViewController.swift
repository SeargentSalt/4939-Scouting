//
//  EventsViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-01.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    @IBOutlet weak var eventsTabelView: UITableView!
    var selectedEvent: String = ""
    
    var sender: String = ""
    
    let events: [String] = ["Durham College", "Humber College", "Ryerson University"]

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTabelView.delegate = self
        eventsTabelView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SchoolsViewController {
            destination.scoutingdata.event = selectedEvent
        }
    }
}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventsCell
        cell.setEventLabel(event: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedEvent = events[indexPath.row]
        performSegue(withIdentifier: "EventCellSelectedScouting", sender: self)
    }
    

}
