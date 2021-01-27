//
//  Extension.swift
//  App Store
//
//  Created by sinbad on 3/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text : String, font : UIFont, numberOfLines : Int = 0) {
        self.init(frame : .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius : CGFloat) {
        self.init(frame : .zero)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String){
        self.init(type : .system)
        self.setTitle(title, for: .normal)
    }
}
