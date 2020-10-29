//
//  ReOrderButton.swift
//  YogiYoCloneIOS
//
//  Created by junho woo on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StackSmall: UIStackView {

    
    private let label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customMedium, size: 13)
        label.textColor = .systemGray
        return label
    }()
    
    private let value : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customMedium, size: 13)
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 50
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func contents(label: String, value: String) {
        self.label.text = label
        self.value.text = value
        
        self.insertArrangedSubview(self.label, at: 0)
        self.insertArrangedSubview(self.value, at: 1)
    }
}
