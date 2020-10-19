//
//  NearestCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class NearestCustomCell: UITableViewCell {
    
    static let identifier = "NearestCustomCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "최근 주소"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLabel()
    }
    private func setLabel() {
        
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
