//
//  AddFriendViewController.swift
//  Friends App
//
//  Created by Ahmed Taha on 11/03/2022.
//

import UIKit

class AddFriendViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var newFriendImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var delegate: addNewFriend?
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        imagePicker.sourceType = .photoLibrary
        
    }
    
    
    @IBAction func galleryBtn(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        
        guard let image = newFriendImage.image else { return }
       
        let imageData = LocalDatabaseManager().convertImageToData(image: image)
        
        let name = nameTextField.text!
        
        let age = Int(ageTextField.text!)!
        
        let phoneNumber = Int(phoneNumberTextField.text!)!
        
        delegate?.addFriend(friend: Friend(name: name, age: age, phoneNumber: phoneNumber, image: imageData))
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let galleryImage = info[.originalImage] as? UIImage{
            
            newFriendImage.image = galleryImage
            
        }
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
}
