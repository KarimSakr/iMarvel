//
//  CharacterCD.swift
//  iMarvel
//
//  Created by Karim Sakr on 07/04/2024.
//

import Foundation
import CoreData

class CharacterCD: NSManagedObject {
    @NSManaged var id: Int
    @NSManaged var name: String
    @NSManaged var thumbnailURL: String
    
}
