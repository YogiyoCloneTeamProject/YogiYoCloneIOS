//
//  SegmentCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/22.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SegmentCell: UICollectionViewCell {
    
    // MARK: Properties
    static let cellID = "SegmentCellID"
    
    private var menuCount = 100...300
    private var reviewCount = 0
    
    private lazy var segmentedControl: UISegmentedControl = {
       let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "메뉴 \(menuCount.randomElement()!)", at: 0, animated: false)
        sc.insertSegment(withTitle: "클린리뷰 \(reviewCount)", at: 1, animated: false)
        sc.insertSegment(withTitle: "정보", at: 2, animated: false)
        sc.selectedSegmentIndex = 0
        sc.layer.masksToBounds = false
        sc.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ], for: .normal)
        sc.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red
        ], for: .selected)
        sc.removeBorders()
        sc.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        return sc
    }()
    
    lazy var buttonBar: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: @Objc
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
      UIView.animate(withDuration: 0.3) {
        self.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
      }
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [segmentedControl, buttonBar].forEach {
            addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        buttonBar.snp.makeConstraints { (make) in
            make.bottom.equalTo(segmentedControl.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(3)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
    }
}
