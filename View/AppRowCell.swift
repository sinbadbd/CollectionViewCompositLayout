//
//  AppRowCell.swift
//  App Store
//
//  Created by sinbad on 3/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class AppRowCell : UICollectionViewCell {
    
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let conpanyLabel = UILabel(text: "Conpany Label", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .blue
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            VerticalStackView(arranagedSubView: [nameLabel,conpanyLabel], spacing:  4) ,
            getButton
            ])
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
