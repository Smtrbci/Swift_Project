//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by Samet Arabacı on 29.10.2024.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLablel: UILabel!
    
    @IBOutlet weak var jobLablel: UILabel!
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLablel.text = selectedSimpson?.name
        jobLablel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image

    }
 
}
