//
//  Router.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case newEndpoint
    
#warning("Add Url")
    var baseUrl: String {
        return "URL_HERE"
    }
    
#warning("Add endpoint")
    var path: String {
        switch self {
        case .newEndpoint:
            return "ENDPOINT_HERE"
        }
    }
    
    var parameters: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default :
            return .get
        }
    }
    
#warning("to implement when API Models are ready")
    //    var type: Decodable.Type {
    //        switch self {
    //        default: return String.self
    //        }
    //    }
    
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


extension URL {
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents.url!
    }
}
