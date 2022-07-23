//
//  ButtonButtonCell.swift
//  Zoo App
//
//  Created by Nijat Mukhtarov on 23.07.22.
//

import UIKit

class ButtonButtonCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
