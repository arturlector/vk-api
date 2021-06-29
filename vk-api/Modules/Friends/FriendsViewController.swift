//
//  FriendsViewController.swift
//  vk-api
//
//  Created by Artur Igberdin on 22.06.2021.
//

import UIKit
import SDWebImage
import Kingfisher

class FriendsViewController: UITableViewController {

    let apiService = APIService()
    
    var friends: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        apiService.getFriendsQuicktype { users in
//            print(users)
//        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        
        apiService.getFriends { [weak self] users in
        
            guard let self = self else { return }
            print(users)
            
            self.friends = users
            self.tableView.reloadData()
        }
    
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.firstName ?? "") \(friend.lastName ?? "")"
        
        guard let urlString = friend.photo50 else { return cell }
        
        guard let url = URL(string: urlString) else { return cell }
        
        //SDWebImage
        //cell.imageView?.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage())
        
        //MANUAL
//        DispatchQueue.global().async {
//            if let url = URL(string: urlString),
//               let data = try? Data(contentsOf: url),
//               let image = UIImage(data: data) {
//
//                DispatchQueue.main.async {
//                    cell.imageView?.image = image
//                }
//            }
//        }
        
        //NSCache
        
        //Kingfisher
        cell.imageView?.kf.setImage(with: url, placeholder: nil, options: [.cacheMemoryOnly], completionHandler: nil)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    


}
