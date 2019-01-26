//
//  DisplayPicturesCell.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2019-01-02.
//  Copyright © 2019 4939. All rights reserved.
//

import UIKit

class DisplayPicturesCell: UICollectionViewCell {
    @IBOutlet weak var displayImageView: UIImageView!
    
    func setDisplayPicture(displayPicture: UIImage) {
        displayImageView.image = displayPicture
    }
}
