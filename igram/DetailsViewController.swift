//
//  DetailsViewController.swift
//  igram
//
//  Created by siddhant on 2/8/18.
//  Copyright © 2018 siddhant. All rights reserved.
//

import UIKit
import Parse
import ParseUI
class DetailsViewController: UIViewController {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var photoView: PFImageView!
    
    var instagramPost: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.captionLabel.text = instagramPost["caption"] as? String
        self.userNameLabel.text = PFUser.current()!.username
        self.photoView.file = instagramPost["media"] as? PFFile
        self.photoView.loadInBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
