//
//  Router.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case fetchCharacterList(skip: Int, limit: Int),
         fetchDetails(id: Int),
         fetchComics(id: Int),
         fetchStories(id: Int),
         fetchSeries(id: Int),
         fetchEvents(id: Int)
    
    var baseUrl: String {
        return Constants.Url.BaseUrl
    }
    
    var path: String {
        switch self {
        case .fetchCharacterList:
            return Constants.Url.Endpoint.fetchCharacterList
            
        case.fetchDetails(let id):
            return Constants.Url.Endpoint.fetchCharacterList + "/\(id)"
        case .fetchComics(let id):
            return Constants.Url.Endpoint.fetchCharacterList + "/\(id)/comics"
        case .fetchStories(let id):
            return Constants.Url.Endpoint.fetchCharacterList + "/\(id)/stories"
        case .fetchSeries(let id):
            return Constants.Url.Endpoint.fetchCharacterList + "/\(id)/series"
        case .fetchEvents(let id):
            return Constants.Url.Endpoint.fetchCharacterList + "/\(id)/events"
        }
    }
    
    var parameters: [String : String] {
        let timeStamp = Date().timeIntervalSince1970
        let privateKey = Bundle().value(ofKey: Constants.BundleKeys.privateKey)
        let publicKey  = Bundle().value(ofKey: Constants.BundleKeys.apiKey)
        let md5Hash = (String(timeStamp) + privateKey + publicKey).md5
        switch self {
        case .fetchCharacterList(let skip, let limit):
            return [
                "limit" : String(limit),
                "offset": String(skip),
                "ts"    : String(timeStamp),
                "apikey": publicKey,
                "hash"  : md5Hash,
            ]
            
        case .fetchDetails:
            return [
                "ts"    : String(timeStamp),
                "apikey": publicKey,
                "hash"  : md5Hash,
            ]
        case .fetchComics(id: let id):
            return [
                "orderBy":"issueNumber",
                "limit"  : "3",
                "ts"     : String(timeStamp),
                "apikey" : publicKey,
                "hash"   : md5Hash,
            ]
        case .fetchStories(id: let id):
            return [
                "orderBy":"modified",
                "limit"  : "3",
                "ts"     : String(timeStamp),
                "apikey" : publicKey,
                "hash"   : md5Hash,
            ]
        case .fetchSeries(id: let id):
            return [
                "orderBy":"startYear",
                "limit"  : "3",
                "ts"     : String(timeStamp),
                "apikey" : publicKey,
                "hash"   : md5Hash,
            ]
        case .fetchEvents(id: let id):
            return [
                "orderBy":"startDate",
                "limit"  : "3",
                "ts"     : String(timeStamp),
                "apikey" : publicKey,
                "hash"   : md5Hash,
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
        case .fetchCharacterList, .fetchDetails:
            return Response<[Character]>.self
        case .fetchComics(id: let id):
            return Response<[Comic]>.self
        case .fetchStories(id: let id):
            return Response<[Story]>.self
        case .fetchSeries(id: let id):
            return Response<[Series]>.self
        case .fetchEvents(id: let id):
            return Response<[Event]>.self
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
        
        static let BaseUrl = "https://gateway.marvel.com"
        
        struct Endpoint {
            static let fetchCharacterList = "v1/public/characters"
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
