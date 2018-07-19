//
//  TestScoketCommentTableViewCell.swift
//  FBhelper
//
//  Created by Taco on 2018/7/18.
//  Copyright © 2018年 Taco. All rights reserved.
//

import UIKit
import Kingfisher

class TestScoketCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var starLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.photoImageView.layer.cornerRadius = 32
        self.photoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(obj:CommentObject) {
        
        self.nameLabel.text = obj.name
        
        self.messageLabel.text = obj.message
        
        var star = ""
        
        if obj.star! > 0
        {
            for i in 1...obj.star!
            {
                if(i<6)
                {
                    star = star+"★ "
                }
            }
            
            self.starLabel.text = star
        }
        else
        {
            self.starLabel.text = star
        }
        
        if let photo = obj.picture
        {
            let url = URL(string: photo)
            //imageView.kf.setImage(with: url)
            self.photoImageView.kf.setImage(with: url)
        }
        
        
    }
    
}
