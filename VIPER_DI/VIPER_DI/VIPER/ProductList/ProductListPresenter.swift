//
//  ProductListPresenter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation


protocol ProductListPresenter
{
    var view: ProductListViewController! { get set }

    func presentData(_ response: ProductList.Data.Response)
}

///
/// Presenter for the Product list view controller.
///
class ProductListPresenterImpl: ProductListPresenter
{
	/// A product list controller.
    weak var view: ProductListViewController!

	///
	/// Presenting the product data.
	///
    func presentData(_ response:  ProductList.Data.Response)
    {
        let productList = response.models.map
        { data -> ProductList.Data.ViewModel in
            let category = data.productInfo.category
            let productName =  data.productInfo.name
            let price = data.productInfo.price

            return ProductList.Data.ViewModel(
				productType: category,
				productName: productName,
				productPrice: price,
				model: data
			)
        }
        if let view = self.view
        {
            view.displayData(productList)
        }
    }
}
