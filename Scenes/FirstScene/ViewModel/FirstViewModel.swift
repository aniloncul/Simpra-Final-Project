//
//  FirstViewModel.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 18.01.2023.
//

import UIKit

protocol FirstViewModelDelegate: AnyObject {
    func didErrorOccured(_ error: Error)
    func didFetchGames()
}

protocol FirstViewModelProtocol {
    var delegate: FirstViewModelDelegate? { get set }
    func fetchGames()
    var numberOfRows: Int { get }
    func titleForRow(_ row: Int) -> String?
    func photoForIndexPath(_ indexPath: IndexPath) -> String?
    
}

// MARK: - Change Handler Enum
enum GamesChange {
    case didErrorOccured(_ error: Error)
    case didFetchGame
}

final class FirstViewModel: FirstViewModelProtocol {
    weak var delegate: FirstViewModelDelegate?
    
    private var gamesList = [Game]() {
        didSet {
            delegate?.didFetchGames()
        }
    }
    
    //MARK: - CollectionView DataSource Parameters
    var numberOfRows: Int {
        gamesList.count
        
    }
    
    func titleForRow(_ row: Int) -> String? {
        gamesList[row].name
    }
    
    func photoForIndexPath(_ indexPath: IndexPath) -> String? {
        gamesList[indexPath.row].background_image
    }
    
    // MARK: - Properties

    var changeHandler: ((GamesChange) -> Void)?
    
    
    
    //MARK: - Fetching Function
    
    func fetchGames() {
        gamesProvider.request(.games) { result in
            switch result {
            case .failure(let error):
                self.delegate?.didErrorOccured(error)
                print(String(describing: error))
            case .success(let response):
                do {
                    let games = try! JSONDecoder().decode(GamesResponse.self, from: response.data)
                    self.gamesList = games.results!
                    print("gelen toplam \(self.gamesList.count)")
                    
                } catch {
                    self.delegate?.didErrorOccured(error)
                }

            }
        }
    }
    
    
   
    
    
}
