//
//  TextFiledCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

struct SignUpUserInfo: Codable {
    let email: String
    let id: Int
    let nickname: String
}

class TextFiledCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "TextFiledCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTF, pwTF, pwCheckTF, nikNameTF])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 회원가입"
        label.font = .systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    
    private let emailTF: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "이메일 주소"
        tf.addLeftPadding()
        return tf
    }()
    
    private let pwTF: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "비밀번호 (영문+숫자+특수문자 조합 8자리이상)"
        tf.isSecureTextEntry = true
        tf.addLeftPadding()
        return tf
    }()
    
    private let pwCheckTF: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "비밀번호 확인"
        tf.isSecureTextEntry = true
        tf.addLeftPadding()
        return tf
    }()
    
    private let nikNameTF: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "닉네임 (권장)"
        tf.addLeftPadding()
        return tf
    }()
    
    private lazy var titleCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var firstCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "이용약관 동의")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "개인정보 수집 및 이용동의")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "전자금융거래 이용약관")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var fourthCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "만 14세 이상 사용자")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var fiffthCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttributeOption(firstText: "요기요 혜택 알림 동의", secondText: "(선택)")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private let firstShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private let secondShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private let thirdShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private let fourthShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private lazy var showContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstShowContentButton, secondShowContentButton, thirdShowContentButton, fourthShowContentButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var acceptStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstCheckBoxButton, secondCheckBoxButton, thirdCheckBoxButton, fourthCheckBoxButton, fiffthCheckBoxButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.addBackgroundWithShadow(color: .lightGray)
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var nextButton: UIButton = {
       let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.imageView?.tintColor = .red
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(nextButtonHandler), for: .touchUpInside)
        return button
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        endEditing(true)
    }
    
    // MARK: @objc
    @objc private func nextButtonHandler() {
        
        // 회원가입 flow -> email, password, nickname 을 받아 post And -pushPhoneAcceptVC-으로 Noti with userInfo(phoneNum = nil)
        guard let email = emailTF.text, let password = pwTF.text, let nickName = nikNameTF.text else { return }
        let parameters = ["email": "\(email)", "password":"\(password)", "nickname": "\(nickName)"]
        
        AF.request("http://52.79.251.125/users", method: .post, parameters: parameters).response { (res) in
            
            if let error = res.error {
                print("----- AF RESPONSE ERROR [POST] (SIGN UP)----- \(error.localizedDescription)")
            }
            
            guard let code = res.response?.statusCode else { return }
            
            if code >= 200, code <= 299 {
                switch res.result {
                    
                case .success(let data):
                    if let data = data {
                        
                        do {
                            let result = try JSONDecoder().decode(SignUpUserInfo.self, from: data)
                            print("----- AF RESULT SUCCESS [POST] (SIGN UP)----- ")
                            
                            UserDefaults.standard.set(result.id, forKey: "id")
                            let emailAndPassword = ["email": email, "password": password]
                            UserDefaults.standard.set(emailAndPassword, forKey: "emailAndPassword")
                            NotificationCenter.default.post(name: pushPhoneAcceptVC, object: nil, userInfo: nil)
                            
                        } catch {
                            print("----- JSONDecoder ERROR (SIGN UP)-----  \(error.localizedDescription)")
                        }
                    }
                    
                case .failure(let error):
                    print("----- AF RESULT FAIL [POST] (SIGN UP)----- \(error.localizedDescription)")
                }
                
            } else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [POST] (SIGN UP)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [POST] (SIGN UP)----- ")
            }
        }
    }
    
    @objc private func didTapCheckBoxButton(_ sender: UIButton) {
        let elements = [titleCheckBoxButton, firstCheckBoxButton, secondCheckBoxButton, thirdCheckBoxButton, fourthCheckBoxButton, fiffthCheckBoxButton]
        if sender == titleCheckBoxButton {
            switch sender.isSelected {
            case false:
                elements.forEach {
                    $0.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
                    $0.isSelected = true
                }
            case true:
                elements.forEach {
                    $0.setImage(UIImage(named: "EmptyBox"), for: .normal)
                    $0.isSelected = false
                }
            }
        } else {
            if titleCheckBoxButton.isSelected {
                titleCheckBoxButton.setImage(UIImage(named: "EmptyBox"), for: .normal)
                titleCheckBoxButton.isSelected = false
            } else {
                titleCheckBoxButton.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
                titleCheckBoxButton.isSelected = true
            }
            switch sender.isSelected {
            case false:
                sender.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
                sender.isSelected = true
            case true:
                sender.setImage(UIImage(named: "EmptyBox"), for: .normal)
                sender.isSelected = false
            }
        }
    }
    
    // MARK: Configure
    private func configure() {
        selectionStyle = .none
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [titleLabel, stackView].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(13)
            make.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(13)
        }
        
        [emailTF, pwTF, pwCheckTF, nikNameTF].forEach {
            $0.snp.makeConstraints { (make) in
                make.height.equalTo(40)
            }
        }
        
        [titleCheckBoxButton, acceptStackView, nextButton].forEach {
            contentView.addSubview($0)
        }
        
        titleCheckBoxButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.stackView.snp.bottom).offset(50)
            make.left.right.equalToSuperview()
            make.height.equalTo(28)
        }
        
        acceptStackView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.titleCheckBoxButton.snp.bottom).offset(29)
            make.left.right.equalToSuperview().inset(13)
            make.height.equalTo(200)
        }

        acceptStackView.addSubview(showContentStackView)

        showContentStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(33)
            make.right.equalToSuperview().inset(28)
        }
        
        nextButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.acceptStackView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(13)
        }
        
    }
}
