//
//  CoreDataManager.swift
//  Todo list
//
//  Created by Ali Tabatabaei on 9/25/18.
//  Copyright © 2018 Ali Tabatabaei. All rights reserved.
//

import CoreData

struct CoreDataManager  {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("loading of store failed: \(error)")
            } else {
                container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            }
        }
        return container
    }()
    
    func createTodo(id: Int32, title: String, status: Bool = false) {
        let context = persistentContainer.viewContext
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
        
        let now = Date()
        var updates = [String: Any]()
        updates["id"] = id
        updates["title"] = title
        updates["status"] = status
        updates["created_at"] = now
        updates["updated_at"] = now
        todo.setValuesForKeys(updates)
        
        do {
            try context.save()
        } catch let error {
            print("Failed to save context with new todo: \(error)")
        }
    }
    
    func fetchTodos(withStatus status: Bool? = nil) -> [Todo] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "updated_at", ascending: true)]
        if let status = status {
            fetchRequest.predicate = NSPredicate(format: "status == %@", NSNumber(value: status))
        }
        
        do {
            let todos = try context.fetch(fetchRequest)
            return todos
        } catch let error {
            print("Failed to fetch todos from context: \(error)")
            return []
        }
    }
    
    func fetchTodo(withId id: Int32) -> Todo? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")
        fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))
        fetchRequest.fetchLimit = 1
        
        do {
            let todos = try context.fetch(fetchRequest)
            return todos[0]
        } catch let error {
            print("Failed to fetch todos from context: \(error)")
            return nil
        }
    }
    
    func updateTodo(withId id: Int32, newTitle title: String? = nil, newStatus status: Bool? = nil) {
        let context = persistentContainer.viewContext
        
        do {
            if let todo = fetchTodo(withId: id) {
                var updates = [String: Any]()
                if let title = title {
                    updates["title"] = title
                }
                if let status = status {
                    updates["status"] = status
                }
                if !updates.isEmpty {
                    let now = Date()
                    updates["updated_at"] = now
                    todo.setValuesForKeys(updates)
                }
                
                try context.save()
            }
        } catch let error {
            print("Failed to update todo \(id) from context: \(error)")
        }
    }
}
