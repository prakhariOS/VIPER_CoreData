//
//  CompanyListInteractor.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import Foundation

protocol CompanyListInteractor
{
    var presenter: CompanyListPresenter! { get set }

	func loadCompany()
}

///
/// An interactor to handle the company list.
///
class CompanyListInteractorImpl: CompanyListInteractor
{
	/// A product list presenter.
    var presenter: CompanyListPresenter!

	private let manager: CompanyManager = CompanyManager()

	/// A company data.
    var companyData: [CompanyEntity]

    init()
    {
        self.companyData = []
    }

	///
	/// Loading the company listing.
	///
    func loadCompany()
    {
		guard let data = self.manager.fetchCompanys(), data.count == 0
		else
		{
			self.deleteCompanyData()
			self.fetchCompanyList()

			self.process(self.companyData)
			return
		}

		self.createCompany()
		self.process(self.companyData)
    }

	///
	/// Pass the company list to presenter.
	///
    private func process(_ data: [CompanyEntity])
    {
        self.presenter.presentData(self.companyData)
    }
}


// MARK: - Create, fetch and delete company data
extension CompanyListInteractorImpl
{
	private func createCompany()
	{
		let company = CompanyEntity(name: "test", id: "1", address: "Jaipur")
		self.manager.createCompany(companyData: company)

		let company1 = CompanyEntity(name: "test1", id: "2", address: "Delhi")
		self.manager.createCompany(companyData: company1)

		let company2 = CompanyEntity(name: "test2", id: "3", address: "banglore")
		self.manager.createCompany(companyData: company2)
		self.fetchCompanyList()
	}

	private func fetchCompanyList()
	{
		self.companyData = self.manager.fetchCompanys() ?? []
	}

	///
	/// Delete the company data, if it's older than 24 hours.
	///
	private func deleteCompanyData()
	{
		guard let companyData = self.manager.fetchCompanys(), companyData.count > 0
		else { return }

		for company in companyData
		{
			let hours = Date().hours(from: company.date)
			if hours > 24
			{
				let deleted = self.manager.deleteCompany(record: company)
				print(deleted)
			}
		}
	}
}
