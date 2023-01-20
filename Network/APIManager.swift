//
//  APIManager.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 20.01.2023.
//

import Foundation
import Moya

class APIManager {
    
    
    func fetchGames(completion: @escaping (Result<GamesResponse, Error>) -> ()) {
        request(target: .games, completion: completion)
        }
    
    func request<T: Decodable>(target: APIRequest, completion: @escaping(Result<T, Error>) -> ()) {

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

