//
//  ViewController.swift
//  NewApplicationDemo
//
//  Created by Samet Arabacı on 12.08.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var benimLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttontiklandi(_ sender: Any) {
        
        benimLabel.text = "Samet Arabacı"
        
    }
}

