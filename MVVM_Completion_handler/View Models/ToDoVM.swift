//
//  ToDoVM.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/6/21.
//

import Foundation

//The View Model is part of MVVM and its responsibility is to handle all of the business logic and functions
//that can be integrated into other files in your project.
class ToDoViewModel {
    typealias CompletionHandler = (()->())?  //Set nickname for your completion handler closure
    private var arrResponse = [ToDoModel]()  //Declaring a variable for the response part of your completion handler - 
    private var error: Error?                //Declaring a variable for the error part of your completion handler
    func getData(completionHandler: CompletionHandler) {
        APIHandler.shared.get(url: URL.init(string: "https://jsonplaceholder.typicode.com/todos")!) { arr, er in    //Tell APIHandler what the url is
            self.arrResponse = arr ?? [ToDoModel]()  //Handle the response
            self.error = er                          //Handle the error
            completionHandler?()                     //Signal to the ViewController that the data is ready
        }
    }
    func getDataArray() -> [ToDoModel] {
        return arrResponse
    }
    func getError() -> Error? {
        return error
    }
    func getRowCount() -> Int {
        return arrResponse.count
    }
    func getTitle(index: Int) -> String {
        return arrResponse[index].title
    }
}
