//
//  ListAssembly.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit
import Swinject

class ProductListAssembly: Assembly
{
    func assemble(container: Container)
    {
        container.register(ProductListViewController.self)
        { r in
            let view = ProductListViewControllerImpl.instantiate()

            var interactor = r.resolve(ProductListInteractor.self)
            var presenter = r.resolve(ProductListPresenter.self)
            let router = r.resolve(BundleMainRouter.self)

            view.interactor = interactor
			interactor?.presenter = presenter
			presenter?.view = view

            view.bundle = r.resolve(Bundle.self)
            view.router = router
            return view
        }

        container.register(ProductListInteractor.self) { reg in
            ProductListInteractorImpl(bundleMainService: reg.resolve(BundleMainService.self)!)
        }

        container.register(ProductListPresenter.self)
        { reg in
            ProductListPresenterImpl()
        }


        container.register(BundleMainRouter.self)
        { r in
            ProductListRouter(
                viewControllerFactory: r.resolve(ViewControllerFactory.self)!
            )
        }
    }
}
