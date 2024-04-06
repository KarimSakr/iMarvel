//
//  DetailsViewController.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailsDisplayLogic: AnyObject {
    
}

class DetailsViewController: UIViewController, DetailsDisplayLogic {
    
    var interactor: DetailsBusinessLogic?
    var router: DetailsRouter?
    
    var id: Int?
}

// MARK: View lifecycle
extension DetailsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .blue
    }
}

//MARK: - setup
extension DetailsViewController {
    
    private func setup() {
        let viewController = self
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter()
        let router = DetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
