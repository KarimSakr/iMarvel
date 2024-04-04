//
//  HomeRouter.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic {
  
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?
  
}
