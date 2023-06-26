//
//  UserObject.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import Foundation

@MainActor class UserObject: ObservableObject {
    @Published var users = [User]()
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPersons")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            _users = Published(initialValue: try JSONDecoder().decode([User].self, from: data))
        } catch {
            _users = Published(initialValue: [])
        }
    }
}
