//
//  APIManager.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 20.01.2023.
//

import Foundation
import Moya


//protocol Networkable {
//    var gamesProvider : MoyaProvider<APIRequest> { get }
//}

class APIManager {
    
    public var gamesProvider = MoyaProvider<APIRequest>()
    
    func fetchGames(completion: @escaping (Result<GamesResponse, Error>) -> ()) {
        request(target: .games, completion: completion)
        }
    
    func searchGame(query: String, completion: @escaping (Result<GamesResponse, Error>) -> ()) {
        request(target: .search(query: query), completion: completion)
        }
    
    func fetchGameScreenshots(id: String, completion: @escaping (Result<ScreenshotResponse, Error>) -> ()) {
        request(target: .screenshots(id: id), completion: completion)
    }

    
    
    
}

private extension APIManager {
    
    private func request<T: Decodable>(target: APIRequest, completion: @escaping(Result<T, Error>) -> ()) {
        gamesProvider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}

