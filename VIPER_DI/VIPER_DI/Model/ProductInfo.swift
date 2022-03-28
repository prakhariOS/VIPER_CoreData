//
//  ProductInfo.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation


///
/// A product information.
///
struct ProductInfo
{
	/// A product id.
    let id: String
	/// A product category/type.
    let category: String?
	/// A product name.
    let name: String?
	/// A product price.
    let price: String?

    init(dict:[String: Any])
    {
		self.id = (dict["id"] as? String ?? "")
        self.category = (dict["category"] as? String)
        self.name = (dict["name"] as? String)
        self.price = (dict["price"] as? String)
    }
}
