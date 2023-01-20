//
//  SecondViewController.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 17.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    private var gamesList: [Game] = []

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName:"SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SecondCollectionViewCell")
        
        fetchTeams()


        
    }
    
    private func fetchTeams() {
        
        guard let url = URL(string: "https://api.rawg.io/api/games?key=3c76fa40925b4028baa37a40687eba2c") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
            
        var task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] data, response, error in
            if error != nil {
                return
            }
            
            if let data = data {
                do {
                    let games = try! JSONDecoder().decode(GamesResponse.self, from: data)
                    self!.gamesList = games.results!
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                } catch {
                    print("Decoding")
                }
                
            }
        }
                
            
            task.resume()
        }


}

//MARK: - TableView Delegate

extension SecondViewController: UICollectionViewDelegate {
    
}

//MARK: - TableView DataSource

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gamesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {fatalError("ProductsCollectionViewCell not found")}
        cell.label.text = gamesList[indexPath.row].name
        
        
        
        return cell
    }
}
    
