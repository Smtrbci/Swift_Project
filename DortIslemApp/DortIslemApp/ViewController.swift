//
//  ViewController.swift
//  DortIslemApp
//
//  Created by Samet Arabacı on 3.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ilkText: UITextField!
    @IBOutlet weak var ikinciText: UITextField!
    
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func toplamaTiklendi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){

                sonuc = ilkSayi + ikinciSayi
                sonucLabel.text = String(sonuc)

            }
            
        }
        
    }
    
    @IBAction func cikarmaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){

                sonuc = ilkSayi - ikinciSayi
                sonucLabel.text = String(sonuc)

            }
            
        }
        
    }
    
    @IBAction func carpmaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){

                sonuc = ilkSayi * ikinciSayi
                sonucLabel.text = String(sonuc)

            }
            
        }
        
    }
    
    @IBAction func bolmeTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){

                sonuc = ilkSayi / ikinciSayi
                sonucLabel.text = String(sonuc)

            }
            
        }
        
    }
    
}

