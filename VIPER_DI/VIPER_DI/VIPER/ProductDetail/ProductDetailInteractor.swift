//
//  ProductDetailInteractor.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation


protocol ProductDetailInteractor
{
	var presenter: ProductDetailPresenter! { get set }

    func presentView()
    func getData(data: ProductDetails.Config)
}

///
/// An interactor to handle the product details.
///
class ProductDetailInteractorImpl: ProductDetailInteractor
{
	/// A product detail presenter.
	var presenter: ProductDetailPresenter!

    func presentView()
    {
        self.presenter.presentViewType()
	}

    func getData(data: ProductDetails.Config)
    {
        self.presenter.presentData(data)
    }
}
