//
//  CompanyDataRepository.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import CoreData

protocol CompanyRepository
{
	func create(companyData: CompanyEntity)
	func getAll() -> [CompanyEntity]?
	func delete(record: CompanyEntity) -> Bool
}

struct CompanyDataRepository: CompanyRepository
{
	func create(companyData: CompanyEntity)
	{
		let company = CDCompany(context: PersistentStorage.shared.context)
		company.name = companyData.name
		company.address = companyData.address
		company.id = companyData.id

		PersistentStorage.shared.saveContext()
	}

	func getAll() -> [CompanyEntity]?
	{
		let result = PersistentStorage.shared.fetchManagedObject(
			managedObject: CDCompany.self
		)
		var companys: [CompanyEntity] = []
		result?.forEach({ (cdCompany) in
			companys.append(cdCompany.convertToCompany())
		})

		return companys
	}

	func delete(record: CompanyEntity) -> Bool
	{
		guard let cdCompany = self.getCompany(byIdentifier: record.id ?? UUID().uuidString)
		else { return false}
        PersistentStorage.shared.context.delete(cdCompany)
        PersistentStorage.shared.saveContext()
        return true
	}
}


// MARK: - Helper methods
extension CompanyDataRepository
{
	private func getCompany(byIdentifier id: String) -> CDCompany?
	{
		let fetchRequest = NSFetchRequest<CDCompany>(entityName: "CDCompany")
		let predicate = NSPredicate(format: "id==%@", id as CVarArg)

		fetchRequest.predicate = predicate
		do {
			let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

			guard result != nil else {return nil}

			return result

		} catch let error {
			debugPrint(error)
		}

		return nil
	}

}
