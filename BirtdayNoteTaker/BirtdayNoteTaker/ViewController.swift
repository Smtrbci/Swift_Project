//
//  ViewController.swift
//  BirtdayNoteTaker
//
//  Created by Samet Arabacı on 17.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birtdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birtdayLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let storyedName = UserDefaults.standard.object(forKey: "name")
        let storyedBirtday = UserDefaults.standard.object(forKey: "birtday")
        
        if let newName = storyedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirtday = storyedBirtday as? String{
            birtdayLabel.text = "Birtday: \(newBirtday)"
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birtdayTextField.text!, forKey: "birtday")
        UserDefaults.standard.synchronize()
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birtdayLabel.text = "Birday: \(birtdayTextField.text!)"
    }
    
    @IBAction func deleteCliked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birtday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birtday")
            birtdayLabel.text = "Birtday: "
        }
    }
    
}

