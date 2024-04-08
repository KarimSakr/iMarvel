//
//  HomeRepository.swift
//  iMarvel
//
//  Created by Karim Sakr on 08/04/2024.
//

import Foundation
import RxSwift

protocol HomeRepositoryProtocol: AnyObject {
    
    func fetch(_ router: Router) -> Single<Response<[Character]>>
    
    func fetchCache() -> [CharacterCD]
    
    func isUserLoggedIn() -> Bool
    
    func logOut()
    
}

class HomeRepository: HomeRepositoryProtocol{
    
    func fetch(_ router: Router) -> Single<Response<[Character]>> {
        return APIClient.shared.request(router)
    }
    
    func fetchCache() -> [CharacterCD] {
        return LocalDatabaseManager.shared.fetch(CharacterCD.self)
    }
    
    func isUserLoggedIn() -> Bool {
        return Persistence.shared.getData(key: Constants.PersistenceKeys.isUserLoggedIn) as? Bool ?? false
    }
    
    func logOut() {
        Persistence.shared.save(key: Constants.PersistenceKeys.isUserLoggedIn, object: false)
    }
}
