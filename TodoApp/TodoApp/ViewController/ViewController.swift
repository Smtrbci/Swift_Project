//
//  ViewController.swift
//  TodoApp
//
//  Created by Samet Arabacı on 13.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        self.title = "Ana Sayfa"
        mainButton.setTitle("Giriş Yap", for: .normal)
        
    }
    
    private func initUI(){
        mainLabel.text = "Hoş Geldiniz!"
    }
    
    @IBAction func mainButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TodoView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TodoViewController") as! TodoViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true, completion: nil)
        print("Butonna bastım")
    }
        
}
