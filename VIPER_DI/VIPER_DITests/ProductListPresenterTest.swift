//
//  ProductListPresenterTest.swift
//  VIPER_DITests
//
//  Created by prakhar gupta on 25/02/22.
//

import XCTest

@testable import VIPER_DI


class ProductListPresenterTest: XCTestCase
{
	var presenter: ProductListPresenter?
	var view = ProductListViewControllerImpl()

	static let info = [
		"id": "1",
		"category": "Baby",
		"name": "Test",
		"price": "100"
	]

	static let productInfo = ProductInfo(dict: info)
	let mockData = ProductDataModel(productInfo: productInfo)

    override func setUpWithError() throws
    {
		presenter?.presentData(ProductList.Data.Response(models: [mockData]))
    }

    override func tearDownWithError() throws
    {
		presenter = nil
    }


    func testASSS()
    {
		let productList = ProductList.Data.ViewModel(
				productType: mockData.productInfo.category,
				productName: mockData.productInfo.name,
				productPrice: mockData.productInfo.price,
				model: mockData
			)
		view.displayData([productList])
	}
}
