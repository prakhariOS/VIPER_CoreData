//
//  ProductListInteractor.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation


protocol ProductListInteractor
{
    var presenter: ProductListPresenter! { get set }

    func shouldShowLoadingMoreDataMessage() -> Bool
    func loadData()
}

///
/// An interactor to handle the product list.
///
class ProductListInteractorImpl: ProductListInteractor
{
	/// A product list presenter.
    var presenter: ProductListPresenter!

	/// A product data.
    var data: [ProductDataModel]

    private let bundleMainService: BundleMainService

	func shouldShowLoadingMoreDataMessage() -> Bool
	{
		return false
	}

    init(bundleMainService: BundleMainService)
    {
        self.bundleMainService = bundleMainService
        self.data = []
    }

	///
	/// Loading the product listing.
	///
    func loadData()
    {
        self.bundleMainService.get()
            .continueOnSuccessWith { models in
                self.process(models)
            }
    }

	///
	/// Pass the product list to presenter.
	///
    private func process(_ data: [ProductDataModel])
    {
        self.presenter.presentData(ProductList.Data.Response(models: data))
    }
}
