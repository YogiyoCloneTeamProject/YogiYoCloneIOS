//
//  StoreInfoCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StoreInfoCell: UICollectionViewCell {
    
    // MARK: Properties
    public var storeInfo: RestaurantInstanceData? {
        didSet {
            guard let storeInfo = storeInfo else { return }
            minPrice = storeInfo.minOrder
            payMent = storeInfo.paymentMethods.joined(separator: ",")
            deliPrice = storeInfo.deliveryCharge
            notiTextLabel.text = storeInfo.notification
        }
    }
    
    static let cellID = "StoreInfoCellID"
    
    private var minPrice: Int? {
        didSet {
            guard let minPrice = minPrice else { return }
            let price = numberFormatter.string(from: NSNumber(value: minPrice))
            let string = "·최소주문  " + "\(price ?? "")" + "원"
            minOrderPrice.setAttribute(label: minOrderPrice, string: string)
        }
    }
    
    private var deliPrice: Int? {
        didSet {
            guard let deliPrice = deliPrice else { return }
            let price = numberFormatter.string(from: NSNumber(value: deliPrice))
            let string = "·배달요금  " + "\(price ?? "")" + "원"
            deliveryPrice.setAttribute(label: deliveryPrice, string: string)
        }
    }
    
    private var payMent: String? {
        didSet {
            guard let payMent = payMent else { return }
            let string = "·결제방법  \(payMent)"
            payMentLbl.setAttribute(label: payMentLbl, string: string)
        }
    }
    
    private var heartCount = 52
    
    
    private lazy var minOrderPrice: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var payMentLbl: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var deliveryPrice: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var payStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [minOrderPrice, payMentLbl, deliveryPrice])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let notiTitle: UILabel = {
        let label = UILabel()
        label.text = "사장님알림"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: . normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private var notiTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var notiView: UIView = {
        let view = UIView()
        
        view.backgroundColor = ColorPiker.lightGray
        
        [notiTitle, moreButton, notiTextLabel].forEach {
            view.addSubview($0)
        }
        
        notiTitle.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(11)
        }
        
        moreButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(11)
        }
        
        notiTextLabel.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.notiTitle.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(11)
            make.bottom.equalToSuperview().inset(12)
        }
        return view
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setTitle("  찜  \(heartCount)", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.tintColor = .black
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.setTitle("공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.tintColor = .black
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addBackgroundButtonStack(color: .white)
        return stackView
    }()
    
    let numberFormatter = NumberFormatter()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        numberFormatter.numberStyle = .decimal
    }

    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [payStackView, notiView, buttonStackView].forEach {
            addSubview($0)
        }
        
        payStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        notiView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.payStackView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.top.equalTo(notiView.snp.bottom).offset(18)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
