//
//  APIHandler.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/6/21.
//

import Foundation
import UIKit

class APIHandler {
    static let shared = APIHandler.init()  //Declaring the "shared" variable because this will allow us to use the APIHandler class within our methods
    
    typealias CompletionHandler = (([ToDoModel]?, Error?)->())? //We use a typealias to give our closure a nickname that allows us to pass                                                                                           this closure as a function parameter and have it be more readable
    typealias PhotosCompletionHandler = (([Photos]?)->())?
    
    private init(){}                                //??????  This gives us a private initilization so that it can only be used here ????
    
    func get(url: URL, completionHandler: CompletionHandler) {  //Function that is used to decode the JSON Data. This funciton accepts a URL and CompletionHandler
        URLSession.shared.dataTask(with: url) { data, response, error in  //Using URLSession built in function to download API data from URL that will be passed
            let model = try? JSONDecoder.init().decode([ToDoModel].self, from: data!)  //Decoding the data from our Model
            completionHandler?(model, error)                            //Filling our "CompletionHandler" closure with the approriate parameters
        }.resume()
    }
    func getPhotos(url: URL, completionHandler: PhotosCompletionHandler) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            let model = try? JSONDecoder.init().decode([Photos].self, from: data!)
            completionHandler?(model)
        }.resume()
    }
}

