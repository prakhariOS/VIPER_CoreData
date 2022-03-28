//
//  CompanyListViewController.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import UIKit


protocol CompanyListViewController: NSObject
{
    var interactor: CompanyListInteractor! { get set }
    var bundle: Bundle! { get set }
    var router: CompanyRouter! { get set }

    func displayData(_ data: [CompanyEntity])
}

///
/// View controller to show the company list.
///
class CompanyListViewControllerImp: UIViewController
{
	/// Company list cell name
	private var CompanyListCellName: String
	{
		return String(describing: ProductListCell.self)
	}

	/// A product list intrector.
	var interactor: CompanyListInteractor!

	/// A bundle.
    var bundle: Bundle!
	/// A bundle router.
    var router: CompanyRouter!
    /// A company list data.
    var companyList: [CompanyEntity] = []

	@IBOutlet private var companyListTableView: UITableView!
}


// MARK: - Storyboard Instantiatable
extension CompanyListViewControllerImp: StoryboardInstantiatable
{
	static let storyboardName = "CompanyList"
}


// MARK: - Overrides
extension CompanyListViewControllerImp
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

		self.companyListTableView.delegate = self
		self.companyListTableView.dataSource = self

        self.registerCell()
		self.interactor.loadCompany()
    }
}

// MARK: - Helper methods
extension CompanyListViewControllerImp
{
	///
	/// Register a product list cell.
	///
	private func registerCell()
	{
		let nib = UINib(
			nibName: self.CompanyListCellName,
			bundle: nil
		)
		self.companyListTableView.register(
			nib,
			forCellReuseIdentifier: self.CompanyListCellName
		)
	}
}


// MARK: - UITableViewDelegate
extension CompanyListViewControllerImp: UITableViewDelegate
{
	func tableView(
		_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath)
	{
	}
}


// MARK: - UITableViewDataSource
extension CompanyListViewControllerImp: UITableViewDataSource
{
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int)
		-> Int
	{
		return self.companyList.count
	}

	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath)
		-> UITableViewCell
	{
        guard let cell = self.companyListTableView.dequeueReusableCell(
			withIdentifier: self.CompanyListCellName,
			for: indexPath) as? ProductListCell
        else { return UITableViewCell() }

        let model = self.companyList[indexPath.row]
        cell.updateCompanyUI(model)
        return cell
	}
}


// MARK: - CompanyListViewController Delegate
extension CompanyListViewControllerImp: CompanyListViewController
{
	///
	/// Displaying a product data.
	///
    func displayData(_ companyList: [CompanyEntity])
    {
        self.companyList = companyList

		guard isViewLoaded else { return }

        DispatchQueue.main.async
        {
            self.companyListTableView.reloadData()
        }
    }
}
