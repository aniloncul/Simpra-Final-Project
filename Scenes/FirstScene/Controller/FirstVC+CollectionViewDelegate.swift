//
//  FirstVC+CollectionViewDelegate.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 20.01.2023.
//

import UIKit

extension FirstViewController: UICollectionViewDelegate {
    
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth / 2 - 7.0, height: .screenWidth / 2 - 7.0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            2
        }
    
    
    
}
