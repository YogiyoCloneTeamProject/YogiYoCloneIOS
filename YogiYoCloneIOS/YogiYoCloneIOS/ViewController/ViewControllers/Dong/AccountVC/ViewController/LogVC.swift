//
//  LogVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire
import AuthenticationServices

protocol LogVCDelegate: class {
    func pushLoggedVC(appUser: AppUser)
}

class LogVC: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    weak var delegate: LogVCDelegate?
    
    let acceptVC = AcceptVC()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapDismissButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapAppleButton(_ sender: UIButton) {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    @objc private func dissmissWhenLogin(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: AppUser] else { return }
        guard let appUser = userInfo["userInfo"] else { return }
        self.dismiss(animated: true, completion: nil)
        delegate?.pushLoggedVC(appUser: appUser)
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapDismissButton))
    }
    
    // MARK: Configure
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LogoImageCell.self, forCellReuseIdentifier: LogoImageCell.cellID)
        tableView.register(LogCell.self, forCellReuseIdentifier: LogCell.cellID)
        tableView.register(SocialLogCell.self, forCellReuseIdentifier: SocialLogCell.cellID)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dissmissWhenLogin), name: logCellObserveName, object: nil)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension LogVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        case 1:
            return 250
        default :
            return 300
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogoImageCell.cellID, for: indexPath) as? LogoImageCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogCell.cellID, for: indexPath) as? LogCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SocialLogCell.cellID, for: indexPath) as? SocialLogCell else { return UITableViewCell() }
            cell.appleButton.addTarget(self, action: #selector(didTapAppleButton), for: .touchUpInside)
            return cell
        }
    }
}

extension LogVC: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let givName = credential.fullName?.givenName else { return }
            guard let famName = credential.fullName?.familyName else { return }
            let strName = famName + givName
            guard let email = credential.email else { return }
            let info: [String : String] = ["fullName": strName, "email": email]
            UserDefaults.standard.set(info, forKey: "appleUserInfo")
            self.navigationController?.pushViewController(self.acceptVC, animated: true)
            print("Login With apple Suc And fullname is \(strName)")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension LogVC: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
