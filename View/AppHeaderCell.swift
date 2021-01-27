//
//  AppHeaderCell.swift
//  App Store
//
//  Created by sinbad on 3/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class AppHeaderCell : UICollectionViewCell {
    
    let conpanyLabel = UILabel(text: "FaceBook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keping up with friends is faster then ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame : frame)
     
        titleLabel.numberOfLines = 2
        
        let stackView  = VerticalStackView(arranagedSubView: [
            conpanyLabel, titleLabel, imageView
            
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
