//
//  Resident+CoreDataProperties.swift
//  SwiftUICoreDataMultipleTest
//
//  Created by Yu on 2023/10/10.
//
//

import Foundation
import CoreData


extension Resident {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Resident> {
        return NSFetchRequest<Resident>(entityName: "Resident")
    }

    @NSManaged public var name: String?

}

extension Resident : Identifiable {

}
