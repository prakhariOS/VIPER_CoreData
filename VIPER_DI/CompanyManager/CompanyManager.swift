//
//  CompanyManager.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import Foundation
import CoreData

struct CompanyManager
{
	private let companyDataRepository = CompanyDataRepository()

    func createCompany(companyData: CompanyEntity)
    {
		self.companyDataRepository.create(companyData: companyData)
    }

    func fetchCompanys() -> [CompanyEntity]?
    {
        return self.companyDataRepository.getAll()
    }

    func deleteCompany(record: CompanyEntity) -> Bool
    {
        return self.companyDataRepository.delete(record: record)
	}
}
