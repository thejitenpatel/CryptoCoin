//
//  LocalFileManager.swift
//  CryptoCoin
//
//  Created by Jiten Patel on 05/02/23.
//

import Foundation
import SwiftUI

class LocalFileManager{
    static let instance = LocalFileManager()
    
    private init(){}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // Create folder
        createFolderIfNeeded(folderName: folderName)
        
        // Get path for image
        guard
            let data = image.pngData(),
            let url = getURlForImage(imageName: imageName, folderName: folderName)
        else {return}
        
        // Save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. ImageName: \(imageName). \(error)")
        }
        
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getURlForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String){
        guard let url = getURLFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                 print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getURlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLFolder(folderName: folderName) else { return nil }
        
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
    
}
