//
//  ProductListRouter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit


protocol BundleMainRouter
{
    func navigateToDetails(productData: ProductInfo, from viewController: UIViewController)

	func navigateToCompanyList(from viewController: UIViewController)
}

///
/// A product list router which responsible to navigate to detail page.
///
class ProductListRouter: BundleMainRouter
{
    internal let viewControllerFactory: ViewControllerFactory

    init(viewControllerFactory: ViewControllerFactory )
    {
        self.viewControllerFactory = viewControllerFactory
    }

	///
    /// if the user click the product go to product detail page.
	///
    func navigateToDetails(productData: ProductInfo, from viewController: UIViewController)
    {
        var next = self.viewControllerFactory.navigateProductDetail()
         next.config = ProductDetails.Config(data: productData)
        guard let nextVC = next as? UIViewController else { return }
        nextVC.loadViewIfNeeded()
       viewController.navigationController?.pushViewController(nextVC, animated: true)
    }

	func navigateToCompanyList(from viewController: UIViewController)
	{
        let next = self.viewControllerFactory.navigateToCompanyList()
        guard let nextVC = next as? UIViewController else { return }
        nextVC.loadViewIfNeeded()
       viewController.navigationController?.pushViewController(nextVC, animated: true)
	}

}
