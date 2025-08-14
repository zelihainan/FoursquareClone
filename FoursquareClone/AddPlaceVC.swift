//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Zeliha İnan on 14.08.2025.
//

import UIKit

class AddPlaceVC: UIViewController {

    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeAtmosphereText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toMapVC", sender: self)
        
    }
    
}
