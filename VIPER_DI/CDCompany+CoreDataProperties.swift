//
//  CDCompany+CoreDataProperties.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//
//

import Foundation
import CoreData


extension CDCompany {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCompany> {
        return NSFetchRequest<CDCompany>(entityName: "CDCompany")
    }

    @NSManaged public var id: String?
    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var date: Date

	func convertToCompany() -> CompanyEntity
	{
		return CompanyEntity(
			name: self.name,
			id: self.id,
			address: self.address
		)
	}

}
