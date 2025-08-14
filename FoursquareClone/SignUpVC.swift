//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Zeliha İnan on 14.08.2025.
//

import UIKit
import Parse

class SignUpVC: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                    return
                }else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(title: "Error", message: "Username or password cannot be empty")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = usernameText.text
            user.password = passwordText.text
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                    return
                }else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(title: "Error", message: "Username or password cannot be empty")
        }
        
        
    }
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

