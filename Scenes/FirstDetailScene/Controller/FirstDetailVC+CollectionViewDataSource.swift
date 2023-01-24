//
//  FirstDetailVC+CollectionViewDataSource.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 24.01.2023.
//

import UIKit

//MARK: - Detail CollectionView Datasource

extension FirstDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        screenShots.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstDetailCollectionViewCell", for: indexPath) as? FirstDetailCollectionViewCell else {fatalError("ProductsCollectionViewCell not found")}
        
        
        let url = URL(string: screenShots[indexPath.row].image!)
        cell.imageView.kf.setImage(with: url)


        return cell
            }
                
    }

//MARK: - Detail CollectionView Delegate

extension FirstDetailViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    
    }
}

//MARK: - Detail CollectionView FlowLayout

extension FirstDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth - 7.0, height: .screenWidth - 7.0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            1
        }
    
    
    
}
