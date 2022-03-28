//
//  CompanyListAssembly.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import UIKit
import Swinject

class CompanyListAssembly: Assembly
{
    func assemble(container: Container)
    {
        container.register(CompanyListViewController.self)
        { reg in
            let view = CompanyListViewControllerImp.instantiate()

            var interactor = reg.resolve(CompanyListInteractor.self)!
            var presenter = reg.resolve(CompanyListPresenter.self)!
            let router = reg.resolve(CompanyRouter.self)!

            view.interactor = interactor
            interactor.presenter = presenter
            presenter.view = view
            view.router = router

            return view
        }

        container.register(CompanyListInteractor.self)
        { reg in
            CompanyListInteractorImpl()
        }

        container.register(CompanyListPresenter.self)
        { reg in
            CompanyListPresenterImpl()
        }

        container.register(CompanyRouter.self)
        { reg in
            CompanyRouterImpl(
                viewControllerFactory: reg.resolve(ViewControllerFactory.self)!,
                uiEntryPoint: reg.resolve(UIEntryPoint.self)!
            )
        }
    }
}
