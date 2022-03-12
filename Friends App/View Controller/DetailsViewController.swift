//
//  DetailsViewController.swift
//  Friends App
//
//  Created by Ahmed Taha on 12/03/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var friendDetailsImage: UIImageView!
    
    @IBOutlet weak var friendDetailsName: UILabel!
    
    @IBOutlet weak var friendDetailsAge: UILabel!
    
    @IBOutlet weak var friendDetailsPhoneNumber: UILabel!
    
    var comingData: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendDetailsImage.image = UIImage(data: comingData.image)
       
        friendDetailsName.text = comingData.name
        
        friendDetailsAge.text = String(comingData.age)
        
        friendDetailsPhoneNumber.text = String(comingData.phoneNumber)
        
    }

}
