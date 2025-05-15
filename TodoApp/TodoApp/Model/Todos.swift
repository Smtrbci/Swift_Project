//
//  Todos.swift
//  TodoApp
//
//  Created by Samet Arabacı on 14.05.2025.
//

import Foundation


struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    var completed: Bool
}
