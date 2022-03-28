//
//  CommonUIAssembly.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit
import Swinject


class CommonUIAssembly: Assembly
{
	/// A assembler.
    private let assembler: Assembler
    /// A ui entry point.
    private let uiEntryPoint: UIEntryPoint

    init(assembler: Assembler, uiEntryPoint: UIEntryPoint)
    {
        self.assembler = assembler
        self.uiEntryPoint = uiEntryPoint
    }

    func assemble(container: Container) {
        container.register(NavigationController.self)
        { reg in
            let vc = NavigationController()
            let delegate = NavigationControllerDelegate()
            vc.strongDelegateReference = delegate
            delegate.setupNavController(navigationController: vc)
            return vc
        }

        container.register(ViewControllerFactory.self)
        { reg in ViewControllerFactoryImpl(assembler: self.assembler) }

        container.register(UIEntryPoint.self)
        { reg in self.uiEntryPoint }.inObjectScope(.container)
    }
}
