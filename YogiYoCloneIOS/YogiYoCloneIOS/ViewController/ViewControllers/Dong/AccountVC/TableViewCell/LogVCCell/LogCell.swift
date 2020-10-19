//
//  LogCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

// 로그인시 반환 ID,Token
struct AppUser: Codable {
    var id: Int
    var email: String
    var nickname: String
    var phone_num: String?
}

struct IdAndToken: Codable {
    var token: String
    var user_id: Int
}

import UIKit
import Alamofire

class LogCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "RestCellID"
    
    public lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "이메일 주소 입력"
        tf.addLeftPadding()
        tf.layer.borderWidth = 1
        tf.layer.borderColor = ColorPiker.lightGray.cgColor
        return tf
    }()
    
    public let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호 입력"
        tf.addLeftPadding()
        tf.layer.borderWidth = 1
        tf.layer.borderColor = ColorPiker.lightGray.cgColor
        return tf
    }()
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "EmptyBox"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -45, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setTitle("자동 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private let findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private let deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let findPwButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private lazy var findStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findIdButton, findPwButton])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        return stackView
    }()
    
//    private lazy var singInButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("로그인 하기", for: .normal)
//        button.backgroundColor = .lightGray
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        return button
//    }()
    
    private lazy var signInButton: UIButton = {
       let button = UIButton()
        button.setTitle("로그인 하기", for: .normal)
        button.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.85)
        button.addTarget(self, action: #selector(singInButtonHandler), for: .touchUpInside)
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
    
    // MARK: @objc
    @objc private func didTapCheckBoxButton() {
        switch checkBoxButton.isSelected {
        case false:
            checkBoxButton.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
            checkBoxButton.isSelected = true
        case true:
            checkBoxButton.setImage(UIImage(named: "EmptyBox"), for: .normal)
            checkBoxButton.isSelected = false
        }
    }
    
    // flow -> email, password 입력후 post - response 받아서 id token 저장후 header에 담아 해당 id get
    @objc private func singInButtonHandler() {
        guard let email = emailTF.text, let password = passwordTF.text else { return }
        let parameters = ["email": "\(email)", "password":"\(password)"]
        AF.request("http://52.79.251.125/users/login", method: .post, parameters: parameters).response { (res) in
            
            if let error = res.error {
                print("----- AF RESPONSE ERROR [POST] (EMAIL,PASSWORD)----- \(error.localizedDescription)")
            }
            
            guard let code = res.response?.statusCode else { return }
                       
            if code >= 200, code <= 299 {
                switch res.result {
                case .success(let data):
                    if let data = data {
                        
                        do {
                            let result = try JSONDecoder().decode(IdAndToken.self, from: data)
                            print("----- AF RESULT SUCCESS [POST] (EMAIL,PASSWORD)----- ")
                            
                            let id = result.user_id
                            let token = "Token \(result.token)"
                            UserDefaults.standard.set(token, forKey: "token")
                            let headers: HTTPHeaders = ["Authorization": token]
                            
                            AF.request("http://52.79.251.125/users/\(id)", method: .get, headers: headers ).response { (res) in
                                
                                if let error = res.error {
                                    print("----- AF RESPONSE ERROR [GET] (USER INFO)----- \(error.localizedDescription)")
                                }
                                
                                guard let code = res.response?.statusCode else { return }
                                           
                                if code >= 200, code <= 299 {
                                    switch res.result {
                                    case .success(let data):
                                        guard let data = data else { return }
                                        
                                        do {
                                            let appUser = try JSONDecoder().decode(AppUser.self, from: data)
                                            let userInfo: [String: AppUser] = ["userInfo": appUser]
                                            NotificationCenter.default.post(name: logCellObserveName, object: nil, userInfo: userInfo)
                                            print("----- AF RESULT SUCCESS [GET] (USER INFO) ----- ")
                                            
                                        } catch {
                                            print("----- JSONDecoder ERROR (USER INFO)-----  \(error.localizedDescription)")
                                        }
                                    case .failure(let error):
                                        print("----- AF RESULT FAIL [GET] (USER INFO)----- \(error.localizedDescription)")
                                    }
                                } else if code >= 400, code <= 499 {
                                    print("----- AF STATUS CODE IS 400 ~ 499 [GET] (USER INFO)----- ")
                                } else {
                                    print("----- AF STATUS CODE IS 500 ~ [GET] (USER INFO)----- ")
                                }
                            }
                            
                        } catch {
                            print("----- JSONDecoder ERROR (EMAIL,PASSWORD)-----  \(error.localizedDescription)")
                        }
                    }
                case .failure(let error):
                    print("----- AF RESULT FAIL [POST] (EMAIL,PASSWORD)----- \(error.localizedDescription)")
                }
                
            }  else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [POST] (EMAIL,PASSWORD)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [POST] (EMAIL,PASSWORD)----- ")
            }
        }
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [emailTF, passwordTF, findStackView, signInButton].forEach{
            contentView.addSubview($0)
        }
        
        contentView.addSubview(checkBoxButton)

        emailTF.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(55)
        }
        
        passwordTF.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(self.emailTF.snp.bottom).offset(10)
            make.height.equalTo(55)
        }
        
        checkBoxButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.passwordTF.snp.bottom).offset(15)
            make.left.equalToSuperview().inset(10)
            make.height.equalTo(27)
        }
        
        findStackView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.passwordTF.snp.bottom).offset(15)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(27)
            self.findStackView.addSubview(self.deviderView)
            self.deviderView.snp.makeConstraints { (make) in
                make.width.equalTo(1)
                make.centerX.equalTo(self.findIdButton.snp.right).offset(1)
                make.top.bottom.equalToSuperview().inset(8)
            }
        }
        
        signInButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(self.findStackView.snp.bottom).offset(10)
            make.height.equalTo(55)
        }
    }
}
