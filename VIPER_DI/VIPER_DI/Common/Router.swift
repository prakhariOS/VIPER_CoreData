//
//  Router.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation


///
/// A router for work flow.
///
protocol Router: NSObject
{
    var workflowRouter: WorkflowRouter { get set }
}
