//
//  CompanyListPresenter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import Foundation


protocol CompanyListPresenter
{
    var view: CompanyListViewControllerImp! { get set }

    func presentData(_ companyList: [CompanyEntity])
}

///
/// The presenter of the EmployeViewController
///
final class CompanyListPresenterImpl: CompanyListPresenter
{
	var view: CompanyListViewControllerImp!

	/// View controller to update.
	private var viewController: CompanyListViewControllerImp!

	func presentData(_ companyList: [CompanyEntity])
	{
		guard let view = self.view else { return }
		view.displayData(companyList)
	}
}
