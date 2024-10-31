//
//  ViewController.swift
//  AlertProject
//
//  Created by Samet Arabacı on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signupClicker(_ sender: Any) {
        /*
        let alert = UIAlertController(title: "Error!", message: "Username not found!", preferredStyle: UIAlertController.Style.alert)
        self.present(alert,animated: true, completion: nil)
        
        let okayAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okayAction)
         */
        if usernameText.text == "" {
            makeAlert(titleInput: "Error!", massageInput: "Username not found!")
        }else if passwordText.text == "" {
            makeAlert(titleInput: "Error!", massageInput: "Password not found!")
        } else if password2Text.text != password2Text.text{
            makeAlert(titleInput: "Error!", massageInput: "Password do not found!")
        }else{
            makeAlert(titleInput: "Success", massageInput: "User Ok")
        }
        
    }
    
    func makeAlert(titleInput: String, massageInput: String){
        let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: UIAlertController.Style.alert)
        let okayAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

