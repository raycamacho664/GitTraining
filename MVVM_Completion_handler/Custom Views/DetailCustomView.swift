//
//  DetailCustomView.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/7/21.
//

import UIKit

class DetailCustomView: UIView, UITableViewDelegate, UITableViewDataSource {
    let detailTblView = UITableView()
    var viewModel: PhotosViewModel?
    var photoModel = Photos()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpDetailTableView()
    }
    func setupViewModel(vm: PhotosViewModel) {  //Can this be in the view model also??
        self.viewModel = vm
    }
    func setUpDetailTableView() {
        addSubview(detailTblView)
        detailTblView.translatesAutoresizingMaskIntoConstraints = false
        detailTblView.backgroundColor = .darkGray
        detailTblView.delegate = self
        detailTblView.dataSource = self
        detailTblView.register(ImageTVC.self, forCellReuseIdentifier: "cell")
        let viewDictionary = ["tblview": detailTblView]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tblview]-0-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tblview]-0-|", options: [], metrics: nil, views: viewDictionary)
        addConstraints(hConstraints)
        addConstraints(vConstraints)
    }
    //---------Tableview Delegate-----------------//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getPhotoRowCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageTVC
        let title = viewModel?.getPhotoTitle(index: indexPath.row) ?? ""
        let urlStr = viewModel?.getPhotoImage(index: indexPath.row)
        let image = try? UIImage.init(data: Data.init(contentsOf: URL.init(string: urlStr!)!))
        cell?.settingData(title: title, image: image)
        return cell ?? ImageTVC()
    }
}
