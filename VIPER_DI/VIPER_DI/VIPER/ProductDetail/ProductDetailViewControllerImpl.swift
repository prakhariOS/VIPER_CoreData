//
//  ProductDetailViewControllerImpl.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit


protocol ProductDetailViewContoller
{
    var router: ProductDetailRouter! { get set }
    var interactor: ProductDetailInteractor! { get set }

    var config: ProductDetails.Config! { get set }

    func displayView(_ viewModel:  ProductDetails.InitUI.ViewModel)

    func showDetails(data: ProductDetails.Config)
}

///
/// View controller to show the product details.
///
class ProductDetailViewControllerImpl: UIViewController
{
	/// A product detail router.
    var router: ProductDetailRouter!
    /// A product detail interactor.
    var interactor: ProductDetailInteractor!

	/// A product detail.
    var config: ProductDetails.Config!
    /// A product detail ui model.
    var uiModel:  ProductDetails.InitUI.ViewModel!

	/// A product name.
	@IBOutlet private var productName: UILabel!
	/// A product type.
	@IBOutlet private var productType: UILabel!
	/// A product price.
	@IBOutlet private var productPrice: UILabel!
}


// MARK: - Overrides
extension ProductDetailViewControllerImpl
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

		self.interactor.presentView()
        self.interactor.getData(data: config)
    }
}


// MARK: - Storyboard Instantiatable
extension ProductDetailViewControllerImpl: StoryboardInstantiatable
{
	static let storyboardName = "ProductDetail"
}


// MARK: - ProductListViewController Delegate
extension ProductDetailViewControllerImpl: ProductDetailViewContoller
{
	///
	/// Display a view.
	///
    func displayView(_ viewModel: ProductDetails.InitUI.ViewModel)
    {
        self.uiModel = viewModel
    }

	///
	/// Show detail on view.
	///
    func showDetails(data: ProductDetails.Config)
    {
        self.productName.text = data.data.name
        self.productType.text = data.data.category
        self.productPrice.text = (data.data.price)
    }
}
