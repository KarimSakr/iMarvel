//
//  APIClient.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation
import RxSwift
import Alamofire

enum APIClientError: LocalizedError {
    case networkError
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Failed to connect to the network"
        case .invalidResponse:
            return "Received invalid response from the server"
        }
    }
}

final class APIClient {
    
    private init() { }
    
    static var shared = APIClient()
    
    func request<T: Decodable>(_ router: Router) -> Single<T> {
        
        return Single.create { single in
            AF.request(router)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        single(.success(data))
                    case .failure(let error):
                        switch error {
                        case .responseSerializationFailed(_):
                            single(.failure(APIClientError.invalidResponse))
                        case .sessionTaskFailed(let error):
                            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                                single(.failure(APIClientError.networkError))
                            } else {
                                single(.failure(error))
                            }
                        default:
                            single(.failure(error))
                        }
                    }
                }
            return Disposables.create()
        }
    }
}
