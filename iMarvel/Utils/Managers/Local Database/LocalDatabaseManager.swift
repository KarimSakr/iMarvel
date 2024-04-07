//
//  LocalDatabaseManager.swift
//  iMarvel
//
//  Created by Karim Sakr on 07/04/2024.
//

import UIKit
import CoreData

class LocalDatabaseManager {
    
    static let shared = LocalDatabaseManager()
    
    private var viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func add<T:NSManagedObject>(_ type: T.Type) -> T? {
        
        guard let entityName = T.entity().name else  { return nil}
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else { return nil }
        let object = T(entity: entity, insertInto: viewContext)
        return object
    }
    
    func fetch<T:NSManagedObject>(_ type: T.Type) -> [T] {
        let request = T.fetchRequest()
        do {
            let result = try viewContext.fetch(request)
            return result as! [T]
        } catch {
            return []
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
