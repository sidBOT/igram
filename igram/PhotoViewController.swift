//
//  PhotoViewController.swift
//  igram
//
//  Created by siddhant on 2/7/18.
//  Copyright © 2018 siddhant. All rights reserved.
//

import UIKit
import Parse

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    
    var myPhotos: [PFObject]? = []

    var userName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(PhotoViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
        
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        self.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let query = PFQuery(className:"Post")
        query.order(byDescending: "createdAt")
        
        query.includeKey("author")
        query.limit = 20

        
        query.findObjectsInBackground { (myPhotos: [PFObject]?, error: Error?) in
            if let myPhotos = myPhotos {
                print("GOES INSIDE")
                self.myPhotos = myPhotos
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                
                
            } else {
                print(error!.localizedDescription)
            }
            
        }
    }
    

    
    @IBAction func logoutAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.logOut()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPhotos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = myPhotos![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoViewCell
        cell.instagramPost = photo
        
        return cell
    }
}
