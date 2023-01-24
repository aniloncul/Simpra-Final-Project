//
//  GamesAPI.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 19.01.2023.
//

import Foundation
import Moya

public var gamesProvider = MoyaProvider<APIRequest>()

import Foundation
import Moya

public enum APIRequest {
    case games
    case getGameDetail(id: Int)
    case getGameListByDeveloperID(id: Int)
    case getGameDeveloperList
}

extension APIRequest: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.rawg.io/")!
    }
    
    public var path: String {
        switch self {
        case .games:
            return "api/games"
        case let .getGameDetail(id):
            return "api/games/\(id)"
        case .getGameListByDeveloperID:
            return "api/games"
        case .getGameDeveloperList:
            return "api/developers"
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .getGameDetail:
            return [
                "key": "3c76fa40925b4028baa37a40687eba2c"
            ]
        case let .getGameListByDeveloperID(id):
            return [
                "key": "3c76fa40925b4028baa37a40687eba2c",
                "developers": id,
                "page_size": 20
            ]
        case .getGameDeveloperList:
            return [
                "key": "3c76fa40925b4028baa37a40687eba2c",
                "page_size": 100
            ]
        case .games:
            return [
                "key": "3c76fa40925b4028baa37a40687eba2c"
            ]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    public var task: Task {
        return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    public var sampleData: Data {
        return "{\"data\": 123}".data(using: .utf8)!
    }
}
