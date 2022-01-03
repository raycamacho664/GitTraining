//
//  DetailViewController.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/7/21.
//

import UIKit

class DetailViewController: UIViewController {
    let viewModel = PhotosViewModel.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.setupDetailView()
        viewModel.getPhotosFromApi {
            DispatchQueue.main.async {
                self.setupDetailView()
            }
        }
    }
    func setupDetailView() {
        let dvc = DetailCustomView.init()
        dvc.setUpDetailTableView()
        dvc.setupViewModel(vm: viewModel)
        dvc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dvc)
        let viewDictionary = ["dvc": dvc]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[dvc]-0-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[dvc]-0-|", options: [], metrics: nil, views: viewDictionary)
        view.addConstraints(hConstraints)
        view.addConstraints(vConstraints)
    }
}
