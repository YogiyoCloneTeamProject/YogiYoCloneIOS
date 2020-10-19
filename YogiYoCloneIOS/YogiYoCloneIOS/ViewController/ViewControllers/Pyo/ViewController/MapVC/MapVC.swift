//
//  MapVC.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class MapVC: UIViewController {
    
    let topView: TopSearchView = {
        let view = TopSearchView()
        return view
    }()
    
    lazy var addressTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NearestCustomCell.self, forCellReuseIdentifier: NearestCustomCell.identifier)
        tableView.register(NearestListCustomCell.self, forCellReuseIdentifier: NearestListCustomCell.identifier)
        tableView.register(ExplainCustomCell.self, forCellReuseIdentifier: ExplainCustomCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    private func setUI() {
        
        view.backgroundColor = ColorPiker.customGray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismiss(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
        title = "배달 주소 설정"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:16, weight: .light)]
        
        topView.searchField.delegate = self
        topView.cancleButton.addTarget(self, action: #selector(cancleToggle(_:)), for: .touchUpInside)
        topView.nowButton.addTarget(self, action: #selector(pushNowVC(_:)), for: .touchUpInside)
        view.addSubview(topView)
        
        view.addSubview(addressTableView)
    }
    private func setLayout() {
        
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(topView.snp.width).multipliedBy(0.32)
        }
        
        addressTableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    @objc private func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @objc private func cancleToggle(_ sender: UIButton) {
        
        topView.searchField.resignFirstResponder()
        topView.searchField.isSelected = false
        
        addressTableView.reloadData()
        
        UIView.animate(withDuration: 0.2) {
            self.topView.cancleButton.alpha = 0
            self.topView.constraint?
                .update(offset: -CollectionDesign.padding)
            self.topView.layoutIfNeeded()
        }
    }
    @objc private func pushNowVC(_ sender: UIButton) {
        let nowVC = NowLocationVC()
        navigationController?.pushViewController(nowVC, animated: true)
    }
}
