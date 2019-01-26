//
//  ViewController.swift
//  4939 Scouting
//
//  Created by Ajay Sharma on 2018-12-26.
//  Copyright © 2018 4939. All rights reserved.
//

import UIKit
import FirebaseDatabase

let currentVersionNumber = 1

class ViewController: UIViewController {
    
    @IBAction func infoButton(_ sender: Any) {
        performSegue(withIdentifier: "DevInfo", sender: self)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        performSegue(withIdentifier: "update", sender: self)
    }
    @IBOutlet weak var displayPicturesCollectionView: UICollectionView!
    var senderButtonTitle: String = ""
    let displayPicutesArray: [UIImage] = [UIImage(named: "displayPic1")!, UIImage(named: "displayPic2")!, UIImage(named: "displayPic3")!]
    @IBAction func scoutingButton(_ sender: Any) {
        performSegue(withIdentifier: "Scouting", sender: self)
    }
    
    @IBAction func ranksButton(_ sender: Any) {
        performSegue(withIdentifier: "Ranks", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPicturesCollectionView.dataSource = self
        displayPicturesCollectionView.delegate = self
        startTimer()
        var ref: DatabaseReference?
        ref = Database.database().reference()
        ref?.observe(.value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            print(value)
            if((value["latestVersion"] as? Int)! > currentVersionNumber) {
                self.createAlert(title: "Please Update", message: "There has been an update to the app. This can fix bugs and/or add new features. Please update as soon as possible.")
            }
        })
        ref?.removeAllObservers()
        
        /*
        ref?.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            print(value)
            if((value["latestVersion"] as? Int)! > currentVersionNumber) {
                self.createAlert(title: "Please Update", message: "There has been an update to the app. This can fix bugs and/or add new features. Please update as soon as possible.")
            }
        })
 */
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @objc func scrollToNextCell(){
        
        //get cell size
        let cellSize = view.frame.size
        
        //get current content Offset of the Collection view
        let contentOffset = displayPicturesCollectionView.contentOffset
        
        if displayPicturesCollectionView.contentSize.width <= displayPicturesCollectionView.contentOffset.x + cellSize.width
        {
            let r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            displayPicturesCollectionView.scrollRectToVisible(r, animated: true)
            
        } else {
            let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            displayPicturesCollectionView.scrollRectToVisible(r, animated: true);
        }
        
    }
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayPicutesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = displayPicutesArray[indexPath.row]
        let displayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayPicturesCell", for: indexPath) as! DisplayPicturesCell
        displayCell.setDisplayPicture(displayPicture: image)
        return displayCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: displayPicturesCollectionView.bounds.width, height: displayPicturesCollectionView.bounds.height)
    }
}
