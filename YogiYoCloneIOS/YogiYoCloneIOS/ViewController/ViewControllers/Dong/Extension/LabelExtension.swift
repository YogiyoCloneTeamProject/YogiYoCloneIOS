//
//  LabelExtension.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setAttribute(label: UILabel, string: String) {
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: NSRange(location: 0, length: 5))
        label.attributedText = attributedString
    }
    
}
