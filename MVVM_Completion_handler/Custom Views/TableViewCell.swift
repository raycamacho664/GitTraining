//
//  TableViewCell.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/6/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    var label = UILabel()   //Initilize a label that will be used inside your custom cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {   //This init needs to be added to the customTVC class
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()                                                                //Call setupUI function
    }
    required init?(coder: NSCoder) {                                               //This init needs to be added to the customTVC class
        super.init(coder: coder)
        setupUI()                                                               //Call setupUI function
    }
    //------------Programmating Autolayout using VFL to set the label------------------------//
    func setupUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        addSubview(label)
        let viewDictionary = ["label": label]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label]-10-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[label]-20-|", options: [], metrics: nil, views: viewDictionary)
        addConstraints(hConstraints)
        addConstraints(vConstraints)
    }
    //-------------Method that is used to assign the labels text to the-------------------//
    //-------------text that will be passed from the tableview cellforRowAt---------------//
    func setData(lblText: String) {
        label.text = lblText
    }
}
