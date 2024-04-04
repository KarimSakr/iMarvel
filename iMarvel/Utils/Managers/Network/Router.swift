//
//  Router.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case fetchCharacterList
    
    var baseUrl: String {
        return Constants.Url.BaseUrl
    }
    
    var path: String {
        switch self {
        case .fetchCharacterList:
            return Constants.Url.Endpoint.fetchCharacterList
        }
    }
    
    var parameters: [String : String] {
        let timeStamp = Date().timeIntervalSince1970
        let privateKey = ""
        let publicKey  = ""
        var md5Hash = (String(timeStamp) + privateKey + publicKey).md5
        switch self {
        default:
            return [
                "ts": String(timeStamp),
                "apikey": publicKey,
                "hash": md5Hash,
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default :
            return .get
        }
    }
    
        var type: Decodable.Type {
            switch self {
            case .fetchCharacterList:
                return Response<Character>.self
            }
        }
    
    var body: Data? {
        switch self {
            
        default: return nil
        }
    }
    
    var header: [String : String] {
        switch self {
        default:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path).appendingQueryParameters(parameters))
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = header
        return urlRequest
    }
    
}

extension Constants {
    
    struct Url {
        
        static let BaseUrl = "https://gateway.marvel.com:443/v1/public"
        
        struct Endpoint {
            static let fetchCharacterList = ""
        }
    }
}


extension URL {
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents.url!
    }
}
