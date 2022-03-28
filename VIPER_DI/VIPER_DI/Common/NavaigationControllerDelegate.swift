//
//  NavaigationControllerDelegate.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//


import UIKit

///
/// A `NavigationControllerDelegate` for setup the image view on navigation.
///
class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate
{
    let imageView: UIImageView

    override init()
    {
        let image = UIImage(named: "")!
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false

        self.imageView = imageView
    }

    func setupNavController(navigationController: NavigationController)
    {
        navigationController.navigationBar.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: navigationController.navigationBar.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: navigationController.navigationBar.bottomAnchor).isActive = true

    }

    func navigationController(
		_ navigationController: UINavigationController,
		willShow viewController: UIViewController,
		animated: Bool)
		{
			navigationController.navigationBar.topItem?.title = ""
		}

    func navigationController(
		_ navigationController: UINavigationController,
		didShow viewController: UIViewController,
		animated: Bool)
    {
    }

}
