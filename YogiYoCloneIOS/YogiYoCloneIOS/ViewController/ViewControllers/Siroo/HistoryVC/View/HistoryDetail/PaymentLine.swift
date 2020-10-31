//
//  MenulistSection.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class PaymentLine: UIStackView {
    
    private let label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        label.textAlignment = .left
        label.textColor = .red
        return label
    }()
    
    private let value : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        label.textAlignment = .right
        label.textColor = .red
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.alignment = .fill
       
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


