//
//  ProductListViewController.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit

protocol ProductListViewController: NSObject
{
    var interactor: ProductListInteractor! { get set }
    var bundle: Bundle! { get set }
    var router: BundleMainRouter! { get set }

    func displayData(_ viewModel: [ProductList.Data.ViewModel])
}

///
/// View controller to show the product list.
///
class ProductListViewControllerImpl: UIViewController
{
	/// Product list cell name
	private var productListCellName: String
	{
		return String(describing: ProductListCell.self)
	}

	/// A product list intrector.
	var interactor: ProductListInteractor!

	/// A bundle.
    var bundle: Bundle!
	/// A bundle router.
    var router: BundleMainRouter!
    /// A product list data.
    var productList: [ProductList.Data.ViewModel] = []

	/// A product list table view.
	@IBOutlet private var productListTableView: UITableView!
}


// MARK: - Overrides
extension ProductListViewControllerImpl
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

		self.productListTableView.delegate = self
		self.productListTableView.dataSource = self

        self.registerCell()
		self.interactor.loadData()
    }
}


// MARK: - Storyboard Instantiatable
extension ProductListViewControllerImpl: StoryboardInstantiatable
{
	static let storyboardName = "ProductList"
}


// MARK: - Helper methods
extension ProductListViewControllerImpl
{
	///
	/// Register a product list cell.
	///
	private func registerCell()
	{
		let nib = UINib(
			nibName: self.productListCellName,
			bundle: nil
		)
		self.productListTableView.register(
			nib,
			forCellReuseIdentifier: self.productListCellName
		)
	}
}


// MARK: - UITableViewDataSource
extension ProductListViewControllerImpl: UITableViewDataSource
{
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int)
		-> Int
	{
		return self.productList.count
	}

	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath)
		-> UITableViewCell
	{
        guard let cell = self.productListTableView.dequeueReusableCell(
			withIdentifier: self.productListCellName,
			for: indexPath) as? ProductListCell
        else { return UITableViewCell() }

        let model = self.productList[indexPath.row]
        cell.updateUI(model.model)
        return cell
	}
}

// MARK: - Button Actions
extension ProductListViewControllerImpl
{
	@IBAction func companysTouched(_ sender: UIButton)
	{
		self.router.navigateToCompanyList(from: self)
	}
}


// MARK: - UITableViewDelegate
extension ProductListViewControllerImpl: UITableViewDelegate
{
	func tableView(
		_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath)
	{
		let productData = (self.productList[indexPath.row].model.productInfo)
        self.router.navigateToDetails(productData: productData, from: self)
	}
}


// MARK: - ProductListViewController Delegate
extension ProductListViewControllerImpl: ProductListViewController
{
	///
	/// Displaying a product data.
	///
    func displayData(_ viewModel: [ProductList.Data.ViewModel])
    {
        self.productList = viewModel

		guard isViewLoaded else { return }

        DispatchQueue.main.async
        {
            self.productListTableView.reloadData()
        }
    }
}

