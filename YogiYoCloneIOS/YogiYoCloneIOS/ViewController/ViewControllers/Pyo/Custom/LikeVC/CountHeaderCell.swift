//
//  CountHeaderCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/02.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CountHeaderCell: UITableViewCell {
    
    static let identifier = "CountHeaderCell"
    
    private let headerLabel = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        setHeaderLabel()
    }
    private func setHeaderLabel() {
        
        self.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(CollectionDesign.textPadding)
            $0.leading.equalToSuperview().inset(20)
        }
    }
    
    func setValue(count: Int) {
        
        let attribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13) ]
        let countString = NSMutableAttributedString(string: "총 \(count)개", attributes: attribute )
        let range = NSRange(location: 2, length: String(count).count)
        
        countString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        
        headerLabel.attributedText = countString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
