//
//  ImageTVC.swift
//  MVVM_Completion_handler
//
//  Created by River Camacho on 10/7/21.
//

import UIKit

class ImageTVC: UITableViewCell {
    var jsonImage = UIImageView()
    var jsonImageTitle = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    func setUpCell() {
        jsonImageTitle.translatesAutoresizingMaskIntoConstraints = false
        jsonImageTitle.numberOfLines = 0
        jsonImageTitle.textColor = .black
        jsonImage.translatesAutoresizingMaskIntoConstraints = false
        jsonImage.backgroundColor = .systemGreen
        addSubview(jsonImage)
        addSubview(jsonImageTitle)
        let viewConstraints = ["title": jsonImageTitle, "image": jsonImage]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[image(150)]-10-[title]-10-|", options: [], metrics: nil, views: viewConstraints)
        let vConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[image(150)]-0-|", options: [], metrics: nil, views: viewConstraints)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[title]-20-|", options: [], metrics: nil, views: viewConstraints)
        addConstraints(hConstraints)
        addConstraints(vConstraints2)
        addConstraints(vConstraints)
    }
    func settingData(title: String?, image: UIImage?) {
        jsonImageTitle.text = "Title: " + (title ?? "")
        jsonImage.image = image
        
        
        
        
        
        //        let titleText = "Title: "
        //        let attributes: [NSAttributedString.Key: Any] = [
        //            .font: UIFont.boldSystemFont(ofSize: 14)]
        //        let attributedString = NSAttributedString(string: titleText, attributes: attributes)
        //

        
    }
    
}

//extension NSAttributedString: Sequence {
//
//}
