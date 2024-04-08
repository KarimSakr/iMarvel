//
//  DetailsRepository.swift
//  iMarvel
//
//  Created by Karim Sakr on 08/04/2024.
//

import Foundation
import RxSwift

protocol DetailsRepositoryProtocol: AnyObject {
    func fetch<T: Decodable>(_ router: Router) -> Single<T>
}

class DetailsRepository: DetailsRepositoryProtocol {
    
    func fetch<T: Decodable>(_ router: Router) -> Single<T> {
        return APIClient.shared.request(router)
    }
}
