//
//  DetailAssembly.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit
import Swinject

class ProductDetailAssembly: Assembly
{
    func assemble(container: Container)
    {
        container.register(ProductDetailViewContoller.self)
        { reg in
            let view = ProductDetailViewControllerImpl.instantiate()

            var interactor = reg.resolve(ProductDetailInteractor.self)!
            var presenter = reg.resolve(ProductDetailPresenter.self)!
            let router = reg.resolve(ProductDetailRouter.self)!

            view.interactor = interactor
            interactor.presenter = presenter
            presenter.view = view
            view.router = router

            return view
        }

        container.register(ProductDetailInteractor.self)
        { reg in
            ProductDetailInteractorImpl()
        }

        container.register(ProductDetailPresenter.self)
        { reg in
            ProductDetailPresenterImpl()
        }

        container.register(ProductDetailRouter.self)
        { reg in
            ProductDetailRouterImpl(
                viewControllerFactory: reg.resolve(ViewControllerFactory.self)!,
                uiEntryPoint: reg.resolve(UIEntryPoint.self)!
            )
        }
    }
}
