//
//  UserViewController.swift
//  PostsApiApp
//
//  Created by Samet Arabacı on 11.11.2024.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    
    var uniqueUsers: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        fetchUsersData()
        
    }
    
    func fetchUsersData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { data,response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            
            guard let data = data else {return}
            
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                
                self.uniqueUsers = self.getUniqueUsers(from: self.users)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch{
                print("Data decoding error: \(error)")
            }
        }.resume()
    }
    
    // Filtreleme func
    func getUniqueUsers(from users: [User]) -> [User] {
        var seenUserIds: Set<Int> = []
        var uniqueUsers: [User] = []
        
        for user in users {
            if !seenUserIds.contains(user.userId) {
                seenUserIds.insert(user.userId)
                uniqueUsers.append(user)
            }
        }
        return uniqueUsers
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uniqueUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        
        let user = uniqueUsers[indexPath.row]
        cell.userLabel.text = String(user.userId)
        return cell
    }
   

}
