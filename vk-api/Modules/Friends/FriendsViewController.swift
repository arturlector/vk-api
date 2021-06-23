//
//  FriendsViewController.swift
//  vk-api
//
//  Created by Artur Igberdin on 22.06.2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getFriendsQuicktype { users in
            
            print(users)
        }

        
    }
    


}
