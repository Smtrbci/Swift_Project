//
//  CustomButtonTableViewCell.swift
//  LandmarkBook
//
//  Created by Samet Arabacı on 18.10.2024.
//

import UIKit

class CustomButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var Textlable: UILabel!
    
    @IBOutlet weak var detalisButton: UIButton!
    
    var buttonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        guard detalisButton != nil, Textlable != nil else {
            print("Bağlantılar eksik.")
            return
        }

        detalisButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        buttonAction?()
    }
    
    
    @IBAction func onClickButton(_ sender: Any) {
    }
    
    
    
}
