//
//  FirstDetailViewModel.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 21.01.2023.
//

import Foundation

protocol GameDetailsViewModelProtocol {
    func fetchScreenshots(with id: Int)
    var screenShots : [ShortScreenshot] { get set }
   
}

protocol GameDetailsViewModelDelegate: AnyObject {
    func gameDetailLoaded(response: GameDetail)
    func gameDetailFailed(_ error: Error)
}

protocol GameDetailsCoreDataDelegate: AnyObject {
    func gameFavoriteStatusChanged()
}

final class FirstDetailViewModel: GameDetailsViewModelProtocol{
    
    private let apiManager = APIManager()
    
    var gameDetailsViewModelDelegate: GameDetailsViewModelDelegate?
    
    var screenShots : [ShortScreenshot] = []
    
    
    //MARK: - Fetch Screenshots
    
    func fetchScreenshots(with id: Int) {
        
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)/screenshots?key=3c76fa40925b4028baa37a40687eba2c") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
            
        var task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] data, response, error in
            if error != nil {
                print(url)
            }
            
            if let data = data {
                do {
                    let screenShots = try! JSONDecoder().decode(ScreenshotResponse.self, from: data)
                    self?.screenShots = screenShots.results!
                
                } catch {
                    print("Decoding")
                }
                
            }
        }
                
            
            task.resume()
        }

}
    
    
    
   
    
    
   
    
  
    
    
    
   
    
   
    

    

    

