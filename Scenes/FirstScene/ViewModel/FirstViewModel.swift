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
    func fetchScreenshots(id: String)
    var numberOfRows: Int { get }
    func titleForRow(_ row: Int) -> String?
    func photoForIndexPath(_ indexPath: IndexPath) -> String?
    func itemAtIndexPath(_ indexPath: IndexPath) -> Game?
    var detailNumberOfRows: Int { get }
    func detailPhotoForIndexPath(_ indexPath: IndexPath) -> String?
    var screenshotList: [Screenshot] { get }
}

// MARK: - Change Handler Enum
enum GamesChange {
    case didErrorOccured(_ error: Error)
    case didFetchGame
}
var changeHandler: ((GamesChange) -> Void)?

// MARK: - Properties
final class FirstViewModel: FirstViewModelProtocol {
    
    
    weak var delegate: FirstViewModelDelegate?
    
    private var gamesList = [Game]() {
        didSet {
            delegate?.didFetchGames()
        }
    }
    
    var screenshotList = [Screenshot]()
    
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
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> Game? {
        gamesList[indexPath.row]
    }
    
    //MARK: - DetailCollectionView DataSource Parameters
    var detailNumberOfRows: Int {
        screenshotList.count
    }
    
    func detailPhotoForIndexPath(_ indexPath: IndexPath) -> String? {
        screenshotList[indexPath.row].image
    }
    
   
    
    //MARK: - Games Fetchings
    
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
    
    //MARK: - Fetching Function
    func fetchScreenshots(id: String) {
        gamesProvider.request(.screenshots(id: id)) { result in
            switch result {
            case .failure(let error):
                self.delegate?.didErrorOccured(error)
                print(String(describing: error))
            case .success(let response):
                do {
                    let screenshots = try! JSONDecoder().decode(ScreenshotResponse.self, from: response.data)
                    self.screenshotList = screenshots.results!
                    
                    
                } catch {
                    self.delegate?.didErrorOccured(error)
                }

            }
        }
    }
    
    
    
    
   
    
    
}
