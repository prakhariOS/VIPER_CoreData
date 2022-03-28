//
//  AppDelegate.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIEntryPoint
{
    var window: UIWindow?
    var assembler: Assembler?

	var rootViewController: UIViewController?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		self.setUpWindow()
		self.injectDependency()
		self.setRootController()
		return true
	}
}


// MARK: - Helper methods
extension AppDelegate
{
	///
	///
	///
    private func setUpWindow()
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
    }

	///
	///
	///
	private func injectDependency()
	{
		self.assembler = Assembler([
			CommonAssembly(),
			ProductListAssembly(),
			AssemblyMainService(),
			CompanyListAssembly(),
			ProductDetailAssembly()
		])
		self.assembler?.apply(
			assembly: CommonUIAssembly(assembler: self.assembler!, uiEntryPoint: self)
		)
	}

	///
	///
	///
	private func setRootController()
	{
        let rootViewController = self.assembler?.resolver.resolve(ProductListViewController.self)!
        self.rootViewController = (rootViewController as? UIViewController)
		let nav = UINavigationController(rootViewController: self.rootViewController!)
		self.window?.rootViewController = nav
		self.window?.makeKeyAndVisible()
	}
}
