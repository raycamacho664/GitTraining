//
//  PhotosViewModel.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/7/21.
//

import Foundation
import UIKit

class PhotosViewModel {
    typealias PhotosCompletionHandler = (()->())?
    private var arrResponse = [Photos]()
    func getPhotosFromApi(completionHandler: PhotosCompletionHandler) {
        APIHandler.shared.getPhotos(url: URL.init(string: "https://jsonplaceholder.typicode.com/photos")!) { arr in
            self.arrResponse = arr ?? [Photos]()
            completionHandler?()
        }
    }
    func getPhotoRowCount() -> Int {
        return arrResponse.count
    }
    func getPhotoTitle(index: Int) -> String {
        return arrResponse[index].title ?? ""
    }
    func getPhotoImage(index: Int) -> String {
        return arrResponse[index].url ?? ""
    }
    
}
