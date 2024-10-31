//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Samet Arabacı on 15.10.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Görünümü nasıl belirliceğini UITableViewDataSource ile belirlerken UITableViewDelegate görünümün ektileşimlerini belirlersin
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var countryName = [String]()
    
    var chosenLandmarkName = ""
    var chosenCountryName = ""
    var chosenLandmarkImages = UIImage()
    
    enum CellType{
        case text
        case button
        case image
    }
    
    struct Museum{
        var landmarkNames : String
        let landmarkImages: String
        var countryName: String
        let cellType : CellType
    }
    
    var data: [Museum] = [
        Museum(landmarkNames: "Colosseum", landmarkImages: "colosseum", countryName: "Italy", cellType: .text),
        Museum(landmarkNames: "Great Wall", landmarkImages: "great-wall", countryName: "China", cellType: .button),
        Museum(landmarkNames: "Kremlin", landmarkImages: "kremlin", countryName: "Russia", cellType: .image),
        Museum(landmarkNames: "Stonehenge", landmarkImages: "Stonehenge", countryName: "United Kingdom", cellType: .text),
        Museum(landmarkNames: "Taj Mahal", landmarkImages: "taj-mahal", countryName: "India", cellType: .button),
        Museum(landmarkNames: "Galata Tower", landmarkImages: "galata-kulesi", countryName: "Turkiye", cellType: .image)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tarihi Yerler"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        //Yeni Data için navigation eklenedi
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped)) //button tetiklemek için #selector kullanılır
        
    }
    
                                                            
    @objc func addButtonTapped() {
            addNewMuseum() //Fonksiyonun işlemi tanımlar
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let museum = data[indexPath.row]
        
        switch museum.cellType{
            
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! CustomTableViewCell
            cell.label.text = museum.landmarkNames
            cell.selectionStyle = .none
            cell.iconImageView.image = UIImage(named: museum.landmarkImages)
            return cell
            
        case .button:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! CustomButtonTableViewCell
            cell.Textlable.text = museum.landmarkNames
            cell.selectionStyle = .none
            cell.detalisButton.setTitle("Detay", for: .normal)
            
            cell.buttonAction = {[weak self] in
                guard let self = self else {return}
                self.performSegue(withIdentifier: "toDetailsVC", sender: museum)
            }
            return cell
            
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! CustomImageTableViewCell
            cell.selectionStyle = .none
            cell.iconImageView.image = UIImage(named: museum.landmarkImages)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetalisVC
            
            if let selectedMuseum = sender as? Museum {
                destinationVC.selectedLandmarkName = selectedMuseum.landmarkNames
                destinationVC.selectedLandmarkImage = UIImage(named: selectedMuseum.landmarkImages) ?? UIImage()
                destinationVC.selectedCountryName = selectedMuseum.countryName
                
                print("Yönlendiriliyor: \(selectedMuseum.landmarkNames)")
            } else {
                print("Seçilen müze bulunamadı.")
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Düzenle"){ [weak self] (action, view, completionHandler) in
            self?.showEditAlert(for: indexPath)
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ [weak self] (action, view, completionHandler) in
            self?.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func showEditAlert(for indexPath: IndexPath){
        let museum = data[indexPath.row]
        
        let alert = UIAlertController(title: "Düzenle", message: "Yeni Bilgileri Girin", preferredStyle: .alert)
        
        alert.addTextField{ textField in
            textField.text = museum.landmarkNames
        }
        alert.addTextField{ textField in
            textField.text = museum.countryName
        }
        
        let saveAction = UIAlertAction(title: "Kaydet", style: .default){ [weak self] _ in
            guard let newName = alert.textFields?[0].text, !newName.isEmpty,
                  let newCountry = alert.textFields?[1].text, !newCountry.isEmpty else {return}
            
            
            self?.data[indexPath.row].landmarkNames = newName
            self?.data[indexPath.row].countryName = newCountry
            
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    
    func addNewMuseum(){
        let alert = UIAlertController(title: "Yeni Müze Ekle", message: "Müze Adı ve Ülkesini girin", preferredStyle: .alert)
        
        alert.addTextField{ textField in
            textField.placeholder = "Müze Adı"
        }
        alert.addTextField{ textField in
            textField.placeholder = "Ülke Adı"
        }
        
        let saveAction = UIAlertAction(title: "Ekle", style: .default){[weak self] _ in
            guard let name = alert.textFields?[0].text, !name.isEmpty,
                  let country = alert.textFields?[1].text, !country.isEmpty else {return}
            
            let newMuseum = Museum(landmarkNames: name, landmarkImages: "galata-kulesi", countryName: country, cellType: .text)
            self?.data.append(newMuseum)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    
    func deleteMuseum(at indexPath: IndexPath){
        data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row < data.count {
                return 140
            } else if indexPath.row == data.count {
                return 150
            } else {
                return 160
            }
        }
    }
    

