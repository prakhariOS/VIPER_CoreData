//
//  WorkFlowRouter.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit

///
/// A router for navigate to next.
///
protocol WorkflowRouter
{
    func navigateToNext(from viewController: UIViewController)
}
