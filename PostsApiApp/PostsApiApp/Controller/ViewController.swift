//
//  ViewController.swift
//  PostsApiApp
//
//  Created by Samet Arabacı on 11.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var listButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Post Sayfasına Hoşgeldiniz"
        listButton.setTitle("Ana Sayfaya Geç", for: .normal)
    
    }

    @IBAction func listButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "UserView", bundle: nil)
        if let tableViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as? UserViewController{
            self.navigationController?.pushViewController(tableViewController, animated: true)
        }
        
        
    }
    
}

