//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Samet Arabacı on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var isJames = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changerPic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changerPic(){
       
        if isJames == true{
            imageView.image = UIImage(named: "james-hetfield-2")
            myLabel.text = "Lars Ulrich"
            isJames = false
        } else {
            imageView.image = UIImage(named: "james-hetfield")
            myLabel.text = "James Hetfield"
            isJames = false
        }
        
        
    }


}

