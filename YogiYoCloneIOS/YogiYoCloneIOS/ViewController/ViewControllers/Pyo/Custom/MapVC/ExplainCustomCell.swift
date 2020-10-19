//
//  ExplainCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ExplainCustomCell: UITableViewCell {
    
    static let identifier = "ExplainCustomCell"
    
    private let explainLabel: UILabel = {
        let label = UILabel()
        label.text = "이렇게 검색해보세요."
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let roadPoint: UILabel = {
        let label = UILabel()
        label.text = "·"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let roadLabel: UILabel = {
        let label = UILabel()
        label.text = "도로명 + 건물번호"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let roadMark: UILabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3))
        label.text = "예시"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12)
        label.layer.cornerRadius = 6
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemRed.cgColor
        return label
    }()
    private let roadExplain: UILabel = {
        let label = UILabel()
        label.text = "서초로 38길 12"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemRed
        return label
    }()
    
    private let localPoint: UILabel = {
        let label = UILabel()
        label.text = "·"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let localLabel: UILabel = {
        let label = UILabel()
        label.text = "지역명(동/리) + 번지"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let localMark: UILabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3))
        label.text = "예시"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12)
        label.layer.cornerRadius = 6
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemRed.cgColor
        return label
    }()
    private let localExplain: UILabel = {
        let label = UILabel()
        label.text = "서초로 1498-5"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemRed
        return label
    }()
    
    private let buildingPoint: UILabel = {
        let label = UILabel()
        label.text = "·"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let buildingLabel: UILabel = {
        let label = UILabel()
        label.text = "지역명(동/리) + 건물명(아파트명)"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let buildingMark: UILabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3))
        label.text = "예시"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12)
        label.layer.cornerRadius = 6
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemRed.cgColor
        return label
    }()
    private let buildingExplain: UILabel = {
        let label = UILabel()
        label.text = "서초동 요기요빌딩"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemRed
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setExplainLabel()
        setRoad()
        setLocal()
        setBuilding()
    }
    
    private func setExplainLabel() {
        
        self.addSubview(explainLabel)
        
        explainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(CollectionDesign.textPadding * 2)
            $0.leading.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    private func setRoad() {
        
        self.addSubview(roadPoint)
        
        roadPoint.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(CollectionDesign.textPadding * 2)
            $0.leading.equalTo(explainLabel)
        }
        
        self.addSubview(roadLabel)
        
        roadLabel.snp.makeConstraints {
            $0.centerY.equalTo(roadPoint)
            $0.leading.equalTo(roadPoint.snp.trailing)
        }
        
        self.addSubview(roadMark)
        
        roadMark.snp.makeConstraints {
            $0.top.equalTo(roadLabel.snp.bottom).offset(CollectionDesign.collectionPadding / 2)
            $0.leading.equalTo(roadLabel)
        }
        
        self.addSubview(roadExplain)
        
        roadExplain.snp.makeConstraints {
            $0.leading.equalTo(roadMark.snp.trailing).offset(CollectionDesign.collectionPadding)
            $0.centerY.equalTo(roadMark)
        }
    }
    private func setLocal() {
        
        self.addSubview(localPoint)
        
        localPoint.snp.makeConstraints {
            $0.top.equalTo(roadMark.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.equalTo(roadPoint)
        }
        
        self.addSubview(localLabel)
        
        localLabel.snp.makeConstraints {
            $0.centerY.equalTo(localPoint)
            $0.leading.equalTo(localPoint.snp.trailing)
        }
        
        self.addSubview(localMark)
        
        localMark.snp.makeConstraints {
            $0.top.equalTo(localLabel.snp.bottom).offset(CollectionDesign.collectionPadding / 2)
            $0.leading.equalTo(localLabel)
        }
        
        self.addSubview(localExplain)
        
        localExplain.snp.makeConstraints {
            $0.leading.equalTo(localMark.snp.trailing).offset(CollectionDesign.collectionPadding)
            $0.centerY.equalTo(localMark)
        }
    }
    private func setBuilding() {
        
        self.addSubview(buildingPoint)
        
        buildingPoint.snp.makeConstraints {
            $0.top.equalTo(localMark.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.equalTo(localPoint)
        }
        
        self.addSubview(buildingLabel)
        
        buildingLabel.snp.makeConstraints {
            $0.centerY.equalTo(buildingPoint)
            $0.leading.equalTo(buildingPoint.snp.trailing)
        }
        
        self.addSubview(buildingMark)
        
        buildingMark.snp.makeConstraints {
            $0.top.equalTo(buildingLabel.snp.bottom).offset(CollectionDesign.collectionPadding / 2)
            $0.leading.equalTo(buildingLabel)
        }
        
        self.addSubview(buildingExplain)
        
        buildingExplain.snp.makeConstraints {
            $0.leading.equalTo(buildingMark.snp.trailing).offset(CollectionDesign.collectionPadding)
            $0.centerY.equalTo(buildingMark)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
