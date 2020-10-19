//
//  SignUpVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavi()
        configureViews()
        moveViewWithKeyboard()
    }
    // MARK: @objc
    @objc private func leftBarButtonHandler() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func pushPhoneAccept() {
        let phoneAcceptVC = PhoneAcceptVC()
        navigationController?.pushViewController(phoneAcceptVC, animated: true)
    }
    
    // MARK: Configure
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(SignUpVCTopCell.self, forCellReuseIdentifier: SignUpVCTopCell.cellID)
        tableView.register(SocialLogCell.self, forCellReuseIdentifier: SocialLogCell.cellID)
        tableView.register(TextFiledCell.self, forCellReuseIdentifier: TextFiledCell.cellID)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushPhoneAccept), name: pushPhoneAcceptVC, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    // MARK: ConfigureNavi
    private func configureNavi() {
        title = "회원가입"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(leftBarButtonHandler))
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        [tableView].forEach {
            view.addSubview($0)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}

extension SignUpVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 40
        case 1:
            return 190
        case 2:
            return 760
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SignUpVCTopCell.cellID, for: indexPath) as? SignUpVCTopCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SocialLogCell.cellID, for: indexPath) as? SocialLogCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFiledCell.cellID, for: indexPath) as? TextFiledCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }

    }
    
}


