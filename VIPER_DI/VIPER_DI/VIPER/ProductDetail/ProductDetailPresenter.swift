//
//  ProductDetailPresenter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit


protocol ProductDetailPresenter
{
    var view: ProductDetailViewContoller! { get set }

    func presentViewType()
    func presentData(_ data: ProductDetails.Config)
}

///
/// Presenter for the Product detail view controller.
///
class ProductDetailPresenterImpl: ProductDetailPresenter
{
	/// A product detail view controller
	var view: ProductDetailViewContoller!

    func presentViewType()
    {
        let viewModel = { () -> ProductDetails.InitUI.ViewModel in
             return ProductDetails.InitUI.ViewModel(title: "Details")
        }()
        self.view.displayView(viewModel)
    }

    func presentData(_ data: ProductDetails.Config)
    {
        self.view.showDetails(data: data)
    }
}
