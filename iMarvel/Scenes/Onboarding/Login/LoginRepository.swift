//
//  LoginRepository.swift
//  iMarvel
//
//  Created by Karim Sakr on 08/04/2024.
//

import Foundation

protocol LoginRepositoryProtocol: AnyObject {
    func save()
}

class LoginRepository: LoginRepositoryProtocol {
    
    func save() {
        Persistence.shared.save(key: Constants.PersistenceKeys.isUserLoggedIn, object: true)
    }
}
