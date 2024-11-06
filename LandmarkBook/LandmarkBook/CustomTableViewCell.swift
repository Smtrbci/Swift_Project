//
//  CustomTableViewCell.swift
//  LandmarkBook
//
//  Created by Samet Arabacı on 16.10.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width / 10
        iconImageView.clipsToBounds = true
    }
    

}
