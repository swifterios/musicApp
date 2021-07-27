//
//  MusicTableViewCell.swift
//  musicApp
//
//  Created by Владислав on 27.07.2021.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    
    @IBOutlet weak var musicLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
