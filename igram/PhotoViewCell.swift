//
//  PhotoViewCell.swift
//  igram
//
//  Created by siddhant on 2/7/18.
//  Copyright © 2018 siddhant. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoViewCell: UITableViewCell {
    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var uploadImage: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var instagramPost: PFObject! {
        willSet {
            print("PRINT")
            self.captionLabel.text = newValue["caption"] as? String!
            self.userNameLabel.text = PFUser.current()!.username
            self.uploadImage.file = newValue["media"] as? PFFile
            self.uploadImage.loadInBackground()
            print("PRINT")
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
