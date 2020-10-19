//
//  FooterView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Cosmos

struct CellData {
    var opened: Bool
    var title: String
    var sectionData: [Menu]
}

protocol PushOrderVCDelegate: class {
    func pushOrderVCDelegate(id: Int)
}

class FooterView: UICollectionReusableView {
    
    weak var delegate: PushOrderVCDelegate?
    
    var tableViewData: [MenuGroup]? {
        didSet {
            guard let tableViewData = tableViewData else { return }
            for data in tableViewData {
                self.data.append(CellData(opened: false, title: data.name, sectionData: data.menu))
                if tableViewData.count == self.data.count {
                    tableView.reloadData()
                }
            }
        }
    }
    
    var data = [CellData]()
    
    // MARK: Properties
    
    static let cellID = "FooterViewCellID"
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuListCell.self, forCellReuseIdentifier: MenuListCell.cellID)
        tableView.register(DetailMenuListCell.self, forCellReuseIdentifier: DetailMenuListCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [tableView].forEach {
            addSubview($0)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}

extension FooterView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else {
            return 130
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].opened == true {
            return data[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuListCell.cellID, for: indexPath) as? MenuListCell else { return UITableViewCell() }
            cell.listTitle.text = data[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMenuListCell.cellID, for: indexPath) as? DetailMenuListCell else { return UITableViewCell() }
            cell.menu = data[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if data[indexPath.section].opened == true {
                data[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
            } else {
                data[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
            }
        } else {
            delegate?.pushOrderVCDelegate(id: data[indexPath.section].sectionData[indexPath.row - 1].id)
        }
    }
}
