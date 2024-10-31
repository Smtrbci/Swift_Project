//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Samet Arabacı on 31.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PopBtn: UIButton!
    
    var commercialPopUp: PopUpUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PopBtn.layer.cornerRadius = 25
        
    }

    @IBAction func PopBtnTapped(_ sender: Any) {
        
        self.commercialPopUp = PopUpUIView(frame: self.view.frame)
        self.commercialPopUp.closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        self.view.addSubview(commercialPopUp)
    }
    @objc func closeBtnTapped(){
        self.commercialPopUp.removeFromSuperview()
    }
    
}

