//
//  FirstTableViewCell.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 19.01.2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    static let identifier = "FirstTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
