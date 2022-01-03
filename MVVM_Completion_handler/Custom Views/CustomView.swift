//
//  CustomView.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/6/21.
//

import UIKit

class CustomView: UIView, UITableViewDelegate, UITableViewDataSource {
    let tblview =  UITableView()      //Initilize a tableview
    let detailButton = UIButton()
    var vm: ToDoViewModel?            //Set var of type "ToDoViewModel" optional
    override init(frame: CGRect) {    //Init needed for autolayout to function properly
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    func setupViewModel(vm: ToDoViewModel) {  //Can this be in the view model also??
        self.vm = vm
    }
    //----- Programmatic Autolayout for Tableview. Datasource and Delegate will also be set here -------------------//
    func setupUI() {
        addSubview(detailButton)
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.backgroundColor = .systemGreen
        detailButton.setTitle("Go to Details", for: .normal)
        detailButton.setTitleColor(.white, for: .normal)
        detailButton.layer.borderWidth = 2.0
        detailButton.layer.cornerRadius = 5.0
//        detailButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        addSubview(tblview)
        tblview.translatesAutoresizingMaskIntoConstraints = false
        tblview.backgroundColor = .systemGray
        tblview.layer.cornerRadius = 5.0
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        let viewDictionary = ["tblview": tblview, "button": detailButton]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[tblview]-10-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[tblview]-40-[button(60)]-80-|", options: [], metrics: nil, views: viewDictionary)
        let hConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[button]-50-|", options: [], metrics: nil, views: viewDictionary)
        addConstraints(hConstraints)
        addConstraints(vConstraints)
        addConstraints(hConstraints2)
    }
    //------- Tableview Delegate Methods ------------------//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getRowCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        cell?.setData(lblText: vm?.getTitle(index: indexPath.row) ?? "")
        return cell ?? TableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
    
