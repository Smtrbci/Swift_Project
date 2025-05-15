//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by Samet Arabacı on 14.05.2025.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var cellLabel: UILabel!
    
    var cellSwitchAction: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
    }
    
    @objc func switchToggled(_ sender: UISwitch) {
        cellSwitchAction?(cellSwitch.isOn)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
