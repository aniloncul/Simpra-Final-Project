//
//  SecondTableViewCell.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 23.01.2023.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var releasedDatelabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "SecondTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }
    
}
