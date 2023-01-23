//
//  FirstVC+CollectionViewDelegate.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 20.01.2023.
//

import UIKit

extension FirstViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
//        guard let gameId = viewModel.itemAtIndexPath(indexPath)?.id else { return }
//        let strgame = String(gameId)
        
        guard let itemAtIndex = viewModel.itemAtIndexPath(indexPath) else { return }
        
        let detailPage = FirstDetailViewController()
        detailPage.item = itemAtIndex
        
//        viewModel.fetchScreenshots(id: strgame)
//        print(viewModel.screenshotList.count)
        
        present(detailPage,animated: true)
        
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth / 2 - 7.0, height: .screenWidth / 2 - 7.0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            2
        }
    
    
    
}
