//
//  LocalDatabaseManager.swift
//  Friends App
//
//  Created by Ahmed Taha on 11/03/2022.
//

import Foundation
import UIKit

class LocalDatabaseManager {
    
    func convertImageToData(image: UIImage) -> Data {
        
        let convertImage = image.pngData()!
        
        return convertImage
        
    }
    
    func saveToDatabase(friendsArray: [Friend]) {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let archiveUrl = documentDirectory.appendingPathComponent("Friends_List").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        
        guard let encodedData = try? propertyListEncoder.encode(friendsArray) else { return}
        
        try? encodedData.write(to: archiveUrl, options: .noFileProtection)
        
    }
    
    func loadData() -> [Friend] {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let archiveUrl = documentDirectory.appendingPathComponent("Friends_List").appendingPathExtension("plist")
        
        guard let retrieveData = try? Data(contentsOf: archiveUrl) else { return [] }
        
        let propertyListDecoder = PropertyListDecoder()
        
        guard let decodedArray = try? propertyListDecoder.decode([Friend].self, from: retrieveData) else { return [] }
        
        return decodedArray
        
    }
    
    
}






