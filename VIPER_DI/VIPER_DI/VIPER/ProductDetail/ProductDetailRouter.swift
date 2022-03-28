//
//  ProductDetailRouter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation

protocol ProductDetailRouter: NavigateToMainRouter
{
	// Nothing
}

///
/// A product detail router implementation.
///
class ProductDetailRouterImpl: ProductDetailRouter
{
	/// A ui entry point.
    var uiEntryPoint: UIEntryPoint
    /// A view controller factory.
    var viewControllerFactory: ViewControllerFactory

    init(viewControllerFactory: ViewControllerFactory, uiEntryPoint: UIEntryPoint)
    {
        self.viewControllerFactory = viewControllerFactory
        self.uiEntryPoint = uiEntryPoint
    }
}
