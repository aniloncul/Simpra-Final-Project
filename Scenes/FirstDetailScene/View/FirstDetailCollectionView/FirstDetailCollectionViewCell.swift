//
//  FirstDetailCollectionViewCell.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 21.01.2023.
//

import UIKit

class FirstDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "FirstDetailCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstDetailCollectionViewCell", bundle: nil)
    }

}
