//
//  FriendsTableViewController.swift
//  Friends App
//
//  Created by Ahmed Taha on 11/03/2022.
//

import UIKit

class FriendsTableViewController: UITableViewController, addNewFriend {
   
    @IBOutlet weak var editSaveButton: UIBarButtonItem!
    
    var isSavedButton = false
    var localDatabase: LocalDatabaseManager!
    var friendArray: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        localDatabase = LocalDatabaseManager()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        friendArray = localDatabase.loadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendTableViewCell
        
        cell.friendImage.image = UIImage(data: friendArray[indexPath.row].image)
        cell.friendName.text = friendArray[indexPath.row].name
        
        cell.showsReorderControl = true
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
        
    }

    
    func addFriend(friend: Friend) {
        
        friendArray.append(friend)
        localDatabase.saveToDatabase(friendsArray: friendArray)
        tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController {
            
            vc.comingData = friendArray[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
     
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            friendArray.remove(at: indexPath.row)
            
            localDatabase.saveToDatabase(friendsArray: friendArray)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
//            tableView.reloadData()
        
        } else if editingStyle == .insert {
            
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let cellToMove = friendArray[sourceIndexPath.row]
        
        friendArray.remove(at: sourceIndexPath.row)
        
        friendArray.insert(cellToMove, at: destinationIndexPath.row)
        
//        UserDefaults.standard.synchronize()
        
    }
    
    
    @IBAction func addNewFriendBtn(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddVC") as? AddFriendViewController {
            
            vc.delegate = self
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    func toggleEditingButton(){
       
        if isSavedButton == false {
            
            self.isEditing = true
            editSaveButton.title = "Save"
            
        }else {
            
            localDatabase.saveToDatabase(friendsArray: friendArray)
            self.isEditing = false
            editSaveButton.title = "Edit"
            
        }
        
        isSavedButton.toggle()
    }
    
    
    @IBAction func editBtn(_ sender: Any) {
        
        toggleEditingButton()
        
    }
    
}
