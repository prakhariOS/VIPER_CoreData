//
//  CommonAssembly.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation
import Swinject

///
/// CommonAssembly provide hook for `Assembler` to load Services
/// into the provided container where container represents a
/// dependency injection container, which stores registrations of service
///
class CommonAssembly: Assembly
{
    func assemble(container: Container)
    {
        container.register(UIApplication.self)
        { r in UIApplication.shared}.inObjectScope(.container)

        container.register(Bundle.self)
        { r in Bundle.main}.inObjectScope(.container)
    }
}
