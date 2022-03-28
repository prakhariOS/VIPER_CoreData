//
//  ProductListCell.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit

///
/// A product list cell which showing a product information.
///
class ProductListCell: UITableViewCell
{
	/// A product name.
	@IBOutlet private var productName: UILabel!
	/// A product type.
	@IBOutlet private var productType: UILabel!
	/// A product price.
	@IBOutlet private var productPrice: UILabel!
}


// MARK: - Helper methods
extension ProductListCell
{
	///
	/// updating the UI.
	///
	func updateUI(_ model: ProductDataModel)
	{
        self.productName.text = model.productInfo.name
        self.productType.text = model.productInfo.category
        self.productPrice.text = ((model.productInfo.price!))
    }

	///
	/// updating the company UI.
	///
	func updateCompanyUI(_ model: CompanyEntity)
	{
        self.productName.text = model.name
        self.productType.text = model.address
		self.productPrice.text = ""
    }
}


// MARK: - Overrides
extension ProductListCell
{
	override func awakeFromNib()
	{
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
