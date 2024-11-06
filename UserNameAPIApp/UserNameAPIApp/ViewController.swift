//
//  ViewController.swift
//  UserNameAPIApp
//
//  Created by Samet Arabacı on 5.11.2024.
//

import UIKit

struct User: Codable {
    
    let id: Int
    let name: String
    let email: String
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//https://chatgpt.com/share/672a7e4e-3a38-8007-9f76-6f85d5b012e8

