//
//  FirstDetailViewController.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 19.01.2023.
//

import UIKit
import Kingfisher

final class FirstDetailViewController: UIViewController {
    
    //MARK: - Properties
    var item: Game?
    
    var gameId: Int? {
        let id = item?.gameId
        return id
    }
    var screenShots : [ShortScreenshot] = []
    
    var details: GameDetail?
    
    private var viewModel = FirstDetailViewModel()
    
    //MARK: - UI Elements

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(FirstDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: FirstDetailCollectionViewCell.identifier)
        }
    }

    @IBAction func favoriteButton(_ sender: Any) {
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBAction func buttonFavoritesClicked(_ sender: Any) {
        
    }

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let gameId = gameId else { return }
        
        fetchScreenshots(with: gameId)
        fetchDetails(with: gameId)
   
        nameLabel.text = item?.name
        dateLabel.text = item?.released
        
        
        
        
        
        
      
    }
    
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
                    DispatchQueue.main.async {
                        self!.collectionView.reloadData()
                    }
                } catch {
                    print("Decoding")
                }
                
            }
        }
        
        
        task.resume()
    }
    
    //MARK: - Fetch Details
    func fetchDetails(with id: Int) {
        
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?key=3c76fa40925b4028baa37a40687eba2c") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        var task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] data, response, error in
            if error != nil {
                print(url)
            }
            
            if let data = data {
                do {
                    let details = try! JSONDecoder().decode(GameDetail.self, from: data)
                    self?.details = details
                    DispatchQueue.main.async {
                        self?.publisherLabel.text = details.publishersString
                        self?.descriptionLabel.text = details.descriptionRaw
                        self?.ratingLabel.text = "\(details.ratingString) / 5"
                    }
                } catch {
                    print("Decoding")
                }
                
            }
        }.resume()
        
    }
    
    
        
    }

   










