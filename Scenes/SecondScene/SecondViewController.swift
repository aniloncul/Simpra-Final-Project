//
//  SecondViewController.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 17.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
          
    }
    
    private func setupView() {
        self.navigationItem.title = "Favorites"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifier)
        //table.register(SecondTableViewCell.nib(), forCellWithReuseIdentifier: SecondTableViewCell.identifier)

    }
     


}

//MARK: - TableView Delegate

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("basıldı")
    }
}

//MARK: - TableView DataSource

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? SecondTableViewCell else {fatalError("ProductsCollectionViewCell not found")}
        cell.nameLabel.text = "memo"
        cell.ratingLabel.text = "memdf"
        cell.releasedDatelabel.text = "memdf"
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        0
//    }
//
//    func collectionView(_ collectionView: UITableView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {fatalError("ProductsCollectionViewCell not found")}
//        cell.label.text = gamesList[indexPath.row].name
//
//
//
//        return cell
//    }
}
    
