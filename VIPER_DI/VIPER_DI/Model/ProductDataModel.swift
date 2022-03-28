//
//  ProductDataModel.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation

///
/// A product data.
///
struct ProductDataModel
{
	/// A product information.
    let productInfo: ProductInfo

    init(productInfo : ProductInfo)
    {
        self.productInfo = productInfo
    }
}
