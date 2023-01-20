//
//  FirstVC+CollectionViewDataSource.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 20.01.2023.
//

import UIKit
import Kingfisher

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell else {fatalError("ProductsCollectionViewCell not found")}
        
        cell.label.text = viewModel.titleForRow(indexPath.row)
        
        
        let url = URL(string: (viewModel.photoForIndexPath(indexPath)!))
        cell.imageView.kf.setImage(with: url)
        


        return cell
            }
                
    }
    
    

