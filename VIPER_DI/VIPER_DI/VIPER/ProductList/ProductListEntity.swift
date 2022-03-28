//
//  ProductListEntity.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation

///
/// A product data.
///
struct ProductList
{
    struct Data
    {
        struct Response
        {
            let models: [ProductDataModel]
        }
        struct ViewModel
        {
			/// A product type.
            let productType: String?
            /// A product name.
            let productName: String?
            /// A product price.
            let productPrice: String?
            /// A selected product info.
            let model: ProductDataModel
        }
    }
}
