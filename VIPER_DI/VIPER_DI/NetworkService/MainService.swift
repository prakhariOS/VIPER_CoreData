//
//  MainService.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation
import Alamofire
import BoltsSwift

///
/// A protocol which is used for get the product data.
///
protocol BundleMainService
{
    func get() -> Task<[ProductDataModel]>
}


///
/// Call the API and get the data.
///
class BundleMainServiceImpl: BundleMainService
{
    private let url: String

    init()
    {
        url = "http://5e209e06e31c6e0014c60962.mockapi.io/api/products"
    }

	///
	///
	///
    func get() -> Task<[ProductDataModel]>
    {
        let completionSource = TaskCompletionSource<[ProductDataModel]>()
        var models = [ProductDataModel]()
        var products = [ProductInfo]()

        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON
		{ response in
                switch response.result{
                case .success(let json):
                    print(json)
                    guard let jsonArray = json as? [[String: Any]] else {
                        return
                    }
                    products = jsonArray.compactMap{ProductInfo(dict: $0)}

                    for idx in 0..<products.count {
                        let model = ProductDataModel(productInfo: products[idx])
                        models.append(model)
                    }
                    completionSource.set(result: models)

                case let .failure(error):
                    print("error: \(error)")
                    completionSource.set(error: error)
                }
        }

        return completionSource.task
    }

}
