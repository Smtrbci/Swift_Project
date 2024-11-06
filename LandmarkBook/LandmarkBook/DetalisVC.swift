//
//  DetalisVC.swift
//  LandmarkBook
//
//  Created by Samet Arabacı on 15.10.2024.
//

import UIKit

class DetalisVC: UIViewController {
    
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedCountryName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Müze"
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage

    }
    
    @IBAction func museumButton(_ sender: UIButton) {
        alertCont(message: "Müze bilgisi", title: "Detay")
    }
    
    func alertCont(message:String, title:String){
        let alertController = UIAlertController(title: title, message: selectedCountryName, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: message, style: .default, handler: nil))
                                  
        present(alertController, animated: true, completion: nil)
    }
    
    
}
