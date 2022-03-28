//
//  AssemplyMainService.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation
import Swinject

///
/// The `AssemblyMainService` organize your
/// `Service` registration in logic groups which allows
/// the user to swap out different implementations of
/// `Services` by providing different `Assembly` instances
/// to the `Assembler`
///
class AssemblyMainService: Assembly
{
    func assemble(container: Container)
    {
        container.register(BundleMainService.self) { r in
            BundleMainServiceImpl()
            }.inObjectScope(.container)
    }
}
