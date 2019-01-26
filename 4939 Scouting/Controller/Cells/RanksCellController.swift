//
//  RanksCellController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-01.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class RanksCellController: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
