//
//  GamesAPI.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 19.01.2023.
//

import Foundation
import Moya

public var gamesProvider = MoyaProvider<APIRequest>()

public enum APIRequest {
    case games
    case search(query: String)
    case screenshots(id: String)
}

extension APIRequest: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: "https://api.rawg.io/api") else {
            fatalError("Base url not found")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .games:
            return "/games"
        case .search(let query):
            return "/games\(query)"
        case .screenshots(let id):
            return "/games\(id)/screenshots"
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    
    public var task: Moya.Task {
        var params: [String: Any] = [:]
        params["key"] = "3c76fa40925b4028baa37a40687eba2c"
        params["page_size"] = 100
        switch self {
        case .search(let query):
            params["search"] = query
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .screenshots(let id):
            params["games_pk"] = id
            params["key"] = "3c76fa40925b4028baa37a40687eba2c"
            params["page_size"] = 100
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    
}
