//
//  FBLiveTableViewCell.swift
//  FBhelper
//
//  Created by Taco on 2018/7/17.
//  Copyright © 2018年 Taco. All rights reserved.
//

import UIKit

class FBLiveTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
