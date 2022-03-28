//
//  UIEntryPoint.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation
import Swinject


///
/// A UI entry point which set and get the `rootViewController`
///
protocol UIEntryPoint: NSObject
{
    var rootViewController: UIViewController? { get set }
}
