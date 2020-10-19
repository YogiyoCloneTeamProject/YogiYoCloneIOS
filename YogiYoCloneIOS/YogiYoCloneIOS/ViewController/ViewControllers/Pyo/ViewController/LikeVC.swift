//
//  LikeVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LikeVC: UIViewController {
    
    private lazy var likeTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorPiker.customGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NilViewCustomCell.self, forCellReuseIdentifier: NilViewCustomCell.identifier)
        tableView.register(CountHeaderCell.self, forCellReuseIdentifier: CountHeaderCell.identifier)
        tableView.register(StoreListCell.self, forCellReuseIdentifier: StoreListCell.identifier)
        return tableView
    }()
    
    var likeData: LikeData?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "찜"
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:16, weight: .light)]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(removeAll(_:)))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        loadData { (LikeData) in
            self.likeData = LikeData
            DispatchQueue.main.async {
                self.setUI()
                self.setLayout()
            }
        }
    }
    
    private func setUI() {
        
        view.addSubview(likeTableView)
    }
    private func setLayout() {
        
        likeTableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func pushlistVC(_ sender: UIButton) {
        let listVC = StoreListVC()
        listVC.categoryIndex = sender.tag
        navigationController?.pushViewController(listVC, animated: true)
    }
    @objc func removeLike(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            sender.isSelected = false
        } else {
            sender.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            sender.isSelected = true
        }
    }
    @objc func removeAll(_ sender: UIButton) {
        likeData = nil
        likeTableView.reloadData()
    }
}
