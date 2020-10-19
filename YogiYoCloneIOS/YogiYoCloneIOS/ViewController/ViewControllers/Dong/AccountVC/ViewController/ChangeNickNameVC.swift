//
//  ChangeNickNameVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/30.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

class ChangeNickNameVC: UIViewController {
    
    // MARK: Properties
    public var appUser: AppUser?
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "닉네임 입력(10자이내)"
        tf.becomeFirstResponder()
        return tf
    }()
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("닉네임 변경 완료", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [textField, button])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavi()
        configureViews()
    }
    
    // MARK: @objc
    @objc private func didTapButton() {
        
        guard let id = self.appUser?.id else { return }
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let header: HTTPHeaders = ["Authorization":"\(token)"]
        
        guard let text = textField.text else { return }
        let param = ["nickname": text]
        
        AF.request("http://52.79.251.125/users/\(id)", method: .patch, parameters: param, headers: header).response { (res) in
            
            if let error = res.error {
                print("----- AF RESPONSE ERROR [PATCH] (NICKNAME)----- \(error.localizedDescription)")
            }
            
            guard let code = res.response?.statusCode else { return }
                       
            if code >= 200, code <= 299 {
                switch res.result {
                    
                case .success(_):
                    self.navigationController?.popViewController(animated: true)
                    print("----- AF RESULT SUCCESS [PATCH] (NICKNAME)----- ")
                case .failure(let error):
                    print("----- AF RESULT FAIL [PATCH] (NICKNAME)----- \(error.localizedDescription)")
                }
                
            }  else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [PATCH] (NICKNAME)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [PATCH] (NICKNAME)----- ")
            }
        }
    }
    
    // MARK: @objc
    @objc private func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureNavi
    private func configureNavi() {
        title = "닉네임 변경"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(20)
        }
        
        textField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(13)
        }
    }
}
