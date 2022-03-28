//
//  ViewControllerFactory.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation

import Swinject
import UIKit

protocol ViewControllerFactory
{
    func bundleNavController() -> NavigationController
    func navigateMainPage() -> ProductListViewController
    func navigateProductDetail() -> ProductDetailViewContoller
    func navigateToCompanyList() -> CompanyListViewController
}


class ViewControllerFactoryImpl: ViewControllerFactory
{
	private let assembler: Assembler

	init(assembler: Assembler)
	{
		self.assembler = assembler
	}

	func bundleNavController() -> NavigationController
	{
		return self.assembler.resolver.resolve(NavigationController.self)!
	}

	func navigateMainPage() -> ProductListViewController
	{
		return self.assembler.resolver.resolve(ProductListViewController.self)!
	}

	func navigateProductDetail() -> ProductDetailViewContoller
	{
		return self.assembler.resolver.resolve(ProductDetailViewContoller.self)!
	}

	func navigateToCompanyList() -> CompanyListViewController
	{
		return self.assembler.resolver.resolve(CompanyListViewController.self)!
	}
}
