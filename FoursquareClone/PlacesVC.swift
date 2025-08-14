//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Zeliha İnan on 14.08.2025.
//

import UIKit
import Parse

class PlacesVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonClicked))
    }
    
    @objc func addButtonClicked() {
        
    }
    @objc func logoutButtonClicked() {
        PFUser.logOutInBackground { (error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            
            }else {
                self.performSegue(withIdentifier: "toSignUpVC", sender: self)
            }
        }
        
    }
    



}
