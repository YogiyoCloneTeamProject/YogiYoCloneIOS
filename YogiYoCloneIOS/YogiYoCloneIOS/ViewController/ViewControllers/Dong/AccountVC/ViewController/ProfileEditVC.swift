//
//  ProfileEditVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

class ProfileEditVC: UIViewController {
    
    // MARK: Properties
    public var appUser: AppUser? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let id = self.appUser?.id else { return }
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let header: HTTPHeaders = ["Authorization":"\(token)"]
        
        AF.request("http://52.79.251.125/users/\(id)", method: .get, headers: header).response { (res) in
            
            if let error = res.error {
                print("----- AF RESPONSE ERROR [GET] (USER INFO)----- \(error.localizedDescription)")
            }
            
            guard let code = res.response?.statusCode else { return }
            
            if code >= 200, code <= 299 {
                switch res.result {
                    
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let result = try JSONDecoder().decode(AppUser.self, from: data)
                        self.appUser = result
                        print("----- AF RESULT SUCCESS [GET] (USER INFO) ----- ")
                        
                    } catch let error {
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
    }
    
    // MARK: @Objc
    @objc private func didTapDismissButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapChangeButton() {
        let changeNickNameVC = ChangeNickNameVC()
        changeNickNameVC.appUser = self.appUser
        navigationController?.pushViewController(changeNickNameVC, animated: true)
    }
    
    @objc private func didTapLeaveButton() {
        alertNormal(title: "요기요", message: "회원탈퇴 하시겠습니까?") { (_) in
            
            guard let id = self.appUser?.id else { return }
            guard let token = UserDefaults.standard.string(forKey: "token") else { return }
            let header: HTTPHeaders = ["Authorization":"\(token)"]
            
            AF.request("http://52.79.251.125/users/\(id)", method: .delete, headers: header).response { (res) in
                
                if let error = res.error {
                    print("----- AF RESPONSE ERROR [DELETE] (USER INFO)----- \(error.localizedDescription)")
                }
                
                guard let code = res.response?.statusCode else { return }
                           
                if code >= 200, code <= 299 {
                    switch res.result {
                        
                    case .success(_):
                        NotificationCenter.default.post(name: logoutObserveName, object: nil, userInfo: nil)
                        self.navigationController?.popViewController(animated: true)
                        print("----- AF RESULT SUCCESS [DELETE] (USER INFO) ----- ")
                        
                    case .failure(let error):
                        print("----- AF RESULT FAIL [DELETE] (USER INFO)----- \(error.localizedDescription)")
                    }
                    
                }  else if code >= 400, code <= 499 {
                    print("----- AF STATUS CODE IS 400 ~ 499 [DELETE] (USER INFO)----- ")
                } else {
                    print("----- AF STATUS CODE IS 500 ~ [DELETE] (USER INFO)----- ")
                }
            }
        }
    }
    
    @objc private func didTapLogoutButton() {
        alertNormal(title: "요기요", message: "로그아웃 하시겠어요?") { (_) in
            
            guard let token = UserDefaults.standard.string(forKey: "token") else { return }
            let header: HTTPHeaders = ["Authorization":"\(token)"]
            
            AF.request("http://52.79.251.125/users/logout", method: .delete, headers: header).response { (res) in
                
                if let error = res.error {
                    print("----- AF RESPONSE ERROR [DELETE] (TOKEN)----- \(error.localizedDescription)")
                }
                
                guard let code = res.response?.statusCode else { return }
                           
                if code >= 200, code <= 299 {
                    switch res.result {
                        
                    case .success(_):
                        NotificationCenter.default.post(name: logoutObserveName, object: nil, userInfo: nil)
                        self.navigationController?.popViewController(animated: true)
                        print("----- AF RESULT SUCCESS [DELETE] (TOKEN) ----- ")
                        
                    case .failure(let error):
                        print("----- AF RESULT FAIL [DELETE] (TOKEN)----- \(error.localizedDescription)")
                    }
                    
                } else if code >= 400, code <= 499 {
                    print("----- AF STATUS CODE IS 400 ~ 499 [DELETE] (TOKEN)----- ")
                } else {
                    print("----- AF STATUS CODE IS 500 ~ [DELETE] (TOKEN)----- ")
                }
            }
        }
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "내 정보 수정"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapDismissButton))
    }
    
    // MARK: Configure
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EmailIDCell.self, forCellReuseIdentifier: EmailIDCell.cellID)
        tableView.register(PasswordCell.self, forCellReuseIdentifier: PasswordCell.cellID)
        tableView.register(PhoneInfoCell.self, forCellReuseIdentifier: PhoneInfoCell.cellID)
        tableView.register(NickNameCell.self, forCellReuseIdentifier: NickNameCell.cellID)
        tableView.register(BottomCell.self, forCellReuseIdentifier: BottomCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .red
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ProfileEditVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 100
        }
        return 65
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmailIDCell.cellID, for: indexPath) as? EmailIDCell else { return UITableViewCell() }
            cell.appUser = self.appUser
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PasswordCell.cellID, for: indexPath) as? PasswordCell else { return UITableViewCell() }
            cell.appUser = self.appUser
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneInfoCell.cellID, for: indexPath) as? PhoneInfoCell else { return UITableViewCell() }
            cell.appUser = self.appUser
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NickNameCell.cellID, for: indexPath) as? NickNameCell else { return UITableViewCell() }
            cell.appUser = self.appUser
            cell.changeButton.addTarget(self, action: #selector(didTapChangeButton), for: .touchUpInside)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomCell.cellID, for: indexPath) as? BottomCell else { return UITableViewCell() }
            cell.logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
            cell.leaveButton.addTarget(self, action: #selector(didTapLeaveButton), for: .touchUpInside)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
