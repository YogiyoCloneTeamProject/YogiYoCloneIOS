//
//  stackBig.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StackBig: UIStackView {

    
    private let orderStatus : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    private let deliveryImage : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
        imageView.frame.size = CGSize(width: 10, height: 10)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.alignment = .fill
        self.layoutIfNeeded()
        self.spacing = 150
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contents(label: String, image: UIImage) {
        self.orderStatus.text = label
        self.deliveryImage.image = image
        
        self.insertArrangedSubview(self.orderStatus, at: 0)
        self.insertArrangedSubview(self.deliveryImage, at: 1)
    }

}
