//
//  NavigateToMainRouter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit

///
/// A protocol is used for navigate to main controller and get the entry point.
///
protocol NavigateToMainRouter
{
    var uiEntryPoint: UIEntryPoint { get }
    var viewControllerFactory: ViewControllerFactory { get }

    func navigateToMain(from viewController: UIViewController)
}

extension NavigateToMainRouter
{
    func navigateToMain(from viewController: UIViewController)
    {
        let next = self.viewControllerFactory.navigateMainPage()

        let navController = self.viewControllerFactory.bundleNavController()
        navController.setViewControllers([next as! UIViewController], animated: false)
        navController.modalPresentationStyle = UIModalPresentationStyle.fullScreen

        let launchScreenExtensionViewController = self.uiEntryPoint.rootViewController!
        let startNavController = launchScreenExtensionViewController.presentedViewController! as! UINavigationController

        let startViewController = startNavController.children.first!
        startNavController.setViewControllers([startViewController], animated: false)

        viewController.dismiss(animated: true)

        startNavController.modalPresentationStyle = .fullScreen

        startNavController.present(navController, animated: true)
    }
}
