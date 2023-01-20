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
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        switch self {
        case .games:
            let params = ["key" : "3c76fa40925b4028baa37a40687eba2c"] as [String : Any]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    
}
