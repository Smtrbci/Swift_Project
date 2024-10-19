//
//  ViewController.swift
//  problemApp
//
//  Created by Samet Arabacı on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.keyboardType = .numberPad
    }

    @IBAction func buttanClicked(_ sender: Any) {
        if let text = TextField.text,
            let number = Double(text)
        {
            resultLabel.text = String( number * 1.9 )
        }else{
            resultLabel.text = "Geçersiz Değer"
        }
    }
    
}

