//
//  ImgExtension.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/7/21.
//

import UIKit

extension UIImageView {
    func getImagesFromServerURL(_ URLString: String) {
        
        //The URL from constant file + the data being grabbed
        let imageURL = Constant.IMAGE_BASE_URL.rawValue + URLString
        //Using if/let to unwrap the data being grabbed
        //
        if let url = URL(string: imageURL) {
            //Set URLSession class closure
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
        
    }
}
