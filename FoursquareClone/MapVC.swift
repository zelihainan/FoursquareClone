//
//  MapVC.swift
//  FoursquareClone
//
//  Created by Zeliha İnan on 14.08.2025.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonClicked))
    }
    
    @objc func saveButtonClicked() {
        //PARSE
        
    }
    
    @objc func backButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }


}
