//
//  SchoolsCell.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-01.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class SchoolsCell: UITableViewCell {

    @IBOutlet weak var schoolLabel: UILabel!
    
    func setSchoolLabel(school: String) {
        schoolLabel.text = school
    }
}
