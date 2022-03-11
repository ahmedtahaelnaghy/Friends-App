//
//  FriendTableViewCell.swift
//  Friends App
//
//  Created by Ahmed Taha on 11/03/2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } 

}
