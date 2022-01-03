//
//  PhotosModel.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/7/21.
//

import Foundation

struct Photos: Decodable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
