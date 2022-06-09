//
//  Journal+CoreDataProperties.swift
//  TakeItEasy
//
//  Created by admin on 6/8/22.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var body: String?
    @NSManaged public var title: String?

}

extension Journal : Identifiable {

}
