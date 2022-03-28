//
//  NavigationController.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit


///
/// A Navigation Controller
///
class NavigationController: UINavigationController
{
    var strongDelegateReference: NavigationControllerDelegate?
    {
        didSet
        {
            self.delegate = self.strongDelegateReference
        }
    }
}


// MARK: - Overrides
extension NavigationController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationBar.topItem?.title = ""
        self.modalPresentationStyle = .fullScreen
		self.navigationBar.barTintColor = .white
    }
}
