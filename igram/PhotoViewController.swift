//
//  PhotoViewController.swift
//  igram
//
//  Created by siddhant on 2/7/18.
//  Copyright © 2018 siddhant. All rights reserved.
//

import UIKit
import Parse

class PhotoViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var userName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.logOut()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for:indexPath) as! PhotoViewCell
        return cell
    }
}