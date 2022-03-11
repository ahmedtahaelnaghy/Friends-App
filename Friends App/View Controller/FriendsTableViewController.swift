//
//  FriendsTableViewController.swift
//  Friends App
//
//  Created by Ahmed Taha on 11/03/2022.
//

import UIKit

class FriendsTableViewController: UITableViewController, addNewFriend {
    
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
     
     @IBAction func addNewFriendBtn(_ sender: Any) {
         
         if let vc = storyboard?.instantiateViewController(withIdentifier: "AddVC") as? AddFriendViewController {
             
             vc.delegate = self
             
             
             navigationController?.pushViewController(vc, animated: true)
             
         } 
         
     }
     
     
     
     
     
     

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
