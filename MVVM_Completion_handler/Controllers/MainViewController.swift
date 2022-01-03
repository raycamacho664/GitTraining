//
//  ViewController.swift
//  MVVM_Completion_handler
//
// Created by River Camacho on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    let vm = ToDoViewModel.init()  //Initilize View Model
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changing Background Color
        self.view.backgroundColor = .systemGray
        self.setupUI()
        vm.getData {                    //Call the "get" function from "ToDoViewModel" class
            DispatchQueue.main.async {  //Tell queue to run this function upon the view loading - Ask about this for claification???
                self.setupUI()          //Call the SetupUI function
            }
        }
    }
    func setupUI() {
        let cv = CustomView.init()   //Initilize the CustomView Class
        cv.setupViewModel(vm: vm)    //Calling setupViewModel with type "ToDoViewModel" which is equal to the constant declared at top
        cv.setupUI()                 //Calling the setupUI function from the CustomView Class
        
        //----------Custom Layout Setup Code Block----------------------//
        cv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cv)
        let viewDictionary = ["cv": cv]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[cv]-0-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[cv]-0-|", options: [], metrics: nil, views: viewDictionary)
        view.addConstraints(hConstraints)
        view.addConstraints(vConstraints)
    }
}
