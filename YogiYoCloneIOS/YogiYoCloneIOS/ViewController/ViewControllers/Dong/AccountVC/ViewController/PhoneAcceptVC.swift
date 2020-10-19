//
//  PhoneAcceptVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class PhoneAcceptVC: UIViewController {
    
    // MARK: Properties
    private let titleLabel: TitleLabel = {
        let label = TitleLabel()
        return label
    }()
    
    private let phoneNumTextField: TextField = {
        let tf = TextField()
        tf.placeholder = "전화번호 입력('-'제외)"
        return tf
    }()
    
    private let getCodeButton: GetCodeButton = {
        let button = GetCodeButton()
        button.addTarget(self, action: #selector(didTapGetCodeButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(phoneNumTextField)
        view.addSubview(getCodeButton)
        phoneNumTextField.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.65)
        }
        getCodeButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.phoneNumTextField.snp.right).offset(7)
        }
        return view
    }()
    
    private let codeTextField: TextField = {
        let tf = TextField()
        tf.placeholder = "6자리 인증번호 입력"
        tf.textContentType = .oneTimeCode
        return tf
    }()
    
    private let helpTitleLabel: HelpTitleLabel = {
        let label = HelpTitleLabel()
        return label
    }()
    
    private let finishButton: FinishButton = {
        let button = FinishButton()
        button.addTarget(self, action: #selector(didTapFinishButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapGetCodeButton() {
        guard let phoneNum = phoneNumTextField.text, phoneNum.count == 11 else { return print("no번호")}
        let number = "+82\(phoneNum)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("VerifyPhoneNumber Error is \(error)")
                debugPrint(error)
                return
            }
            //            print(verificationID)
        }
    }
    
    // 회원가입 flow
    @objc private func didTapFinishButton() {
        
        guard let phoneNum = phoneNumTextField.text else { return }
        let parameters = ["phone_num":"\(phoneNum.addingDashes())"]
        
        let id = UserDefaults.standard.integer(forKey: "id")
        
        AF.request("http://52.79.251.125/users/\(id)/authorize_phone_num", method: .patch, parameters:parameters).response { (res) in
            
            if let error = res.error {
                print("----- AF RESPONSE ERROR [PATCH] (PHONE NUMBER)----- \(error.localizedDescription)")
            }
            
            guard let code = res.response?.statusCode else { return }
            
            if code >= 200, code <= 299 {
                switch res.result {
                case .success(let data):
                    if data != nil {
                        
                        guard self.codeTextField.text?.count == 6 else { return }
                        
                        self.dismiss(animated: true) {
                            // 회원가입 완료후 dismiss - AppUser 생성후 noti userInfo로 쏴주기 - AccountVC에서 info받아서 loggedAccountVC에 userinfo에 받은 info를 넣어주고 present
                            
                            guard let logInfo = UserDefaults.standard.dictionary(forKey: "emailAndPassword") as? [String: String] else { return }
                            print("----- Email And Password is \(logInfo)")
                            
                            AF.request("http://52.79.251.125/users/login", method: .post, parameters: logInfo).response { (res) in
                                
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
                                                let id = result.user_id
                                                let token = "Token \(result.token)"
                                                let headers: HTTPHeaders = ["Authorization": token]
                                                UserDefaults.standard.set(token, forKey: "token")
                                                print("----- AF RESULT SUCCESS [POST] (EMAIL,PASSWORD)----- ")
                                                
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
                                                                let user = try JSONDecoder().decode(AppUser.self, from: data)
                                                                let userInfo: [String: AppUser] = ["userInfo": user]
                                                                NotificationCenter.default.post(name: presentLoggedAccountVCObserveName, object: nil, userInfo: userInfo)
                                                                print("----- AF RESULT SUCCESS [GET] ((USER INFO) LOGIN SUCCESS) ----- ")
                                                            } catch {
                                                                print("----- JSONDecoder ERROR (USER INFO)-----  \(error.localizedDescription)")
                                                            }
                                                            
                                                        case .failure(let error):
                                                            print("----- AF RESULT FAIL [GET] (USER INFO)----- \(error.localizedDescription)")
                                                        }
                                                        
                                                    }
                                                }
                                                
                                            } catch {
                                                print("----- JSONDecoder ERROR (EMAIL,PASSWORD)-----  \(error.localizedDescription)")
                                            }
                                        }
                                        
                                    case .failure(let error):
                                        print("----- AF RESULT FAIL [POST] (EMAIL,PASSWORD)----- \(error.localizedDescription)")
                                    }
                                    
                                } else if code >= 400, code <= 499 {
                                    print("----- AF STATUS CODE IS 400 ~ 499 [POST] (EMAIL,PASSWORD)----- ")
                                } else {
                                    print("----- AF STATUS CODE IS 500 ~ [POST] (EMAIL,PASSWORD)----- ")
                                }
                            }
                        }
                    }
                    
                case .failure(let error):
                    print("----- AF RESULT FAIL [PATCH] (PHONE NUMBER)----- \(error.localizedDescription)")
                }
                
            } else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [PATCH] (PHONE NUMBER)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [PATCH] (PHONE NUMBER)----- ")
            }
        }
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "휴대폰 인증"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
    }
    
    // MARK: Configure
    private func configure() {
        Auth.auth().languageCode = "kr"
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        [titleLabel, containerView, codeTextField, helpTitleLabel, finishButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        containerView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.titleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        codeTextField.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.containerView.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        helpTitleLabel.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.codeTextField.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        finishButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.helpTitleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
    }
    
}

extension String {
    
    func addingDashes() -> String {
        
        var result = ""
        
        for (offset, character) in self.enumerated() {
            
            if offset != 0 && offset % 3 == 0 || offset != 0 && offset % 7 == 0 {
                if offset % 6 != 0, offset % 9 != 0 {
                    result.append("-")
                }
            }
            
            result.append(character)
        }
        return result
    }
}
