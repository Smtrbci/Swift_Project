//
//  TodoViewController.swift
//  TodoApp
//
//  Created by Samet Arabacı on 13.05.2025.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoList: [Todo] = []

    @IBOutlet weak var todoTabeleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTabeleView.dataSource = self
        todoTabeleView.delegate = self
        
        self.title = "ToDo Listesi"
        
        fetchTodos{ todo in
            self.todoList = todo
            self.todoTabeleView.reloadData()
        }
        
    }
    
    func fetchTodos(comletion: @escaping ([Todo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Url geçersiz.")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Hata oluştu: \(error)")
                return
            }
            guard let data = data else {
                print("Veri alınamadı.")
                return
            }
            do {
                let todos = try JSONDecoder().decode([Todo].self, from: data)
                DispatchQueue.main.async {
                    comletion(todos)
                }
            }catch {
                print("Çözümleme hatası: \(error)")
            }
        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("📊 Row count: \(todoList.count)")
        let todo = todoList[indexPath.row]
        
        guard let cell = todoTabeleView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellLabel.text = todo.title
        cell.cellSwitch.isOn = todo.completed
        
        cell.cellSwitchAction = { [weak self] isOn in
            print("🔄 Switch changed: \(isOn)")
            self?.todoList[indexPath.row].completed = isOn
            print("Todo ID \(todo.id) completion status: \(isOn)")
        }
        
        return cell
    }
    

}
