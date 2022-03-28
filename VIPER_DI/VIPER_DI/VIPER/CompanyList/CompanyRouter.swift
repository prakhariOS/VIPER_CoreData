//
//  CompanyRouter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import Foundation


protocol CompanyRouter: NavigateToMainRouter
{
	// Nothing
}

///
/// A company list router.
///
class CompanyRouterImpl: CompanyRouter
{
	/// A ui entry point.
    var uiEntryPoint: UIEntryPoint
    /// A view controller factory.
    var viewControllerFactory: ViewControllerFactory

    init(viewControllerFactory: ViewControllerFactory, uiEntryPoint: UIEntryPoint)
    {
        self.viewControllerFactory = viewControllerFactory
        self.uiEntryPoint = uiEntryPoint
    }
}
