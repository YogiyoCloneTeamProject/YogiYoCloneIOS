//
//  StorebigView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/18.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


class StoreFilterbigView: UIView {
    
    // storeFilterView: StoreListFilterViewd 의 인스턴스 / 곧 addSubview로 화면에 보여질 인스턴스 <id: 1>
    public var storeFilterView: StoreListFilterView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        
    }
    
    func setStoreFilterView(_ storeFilterView: StoreListFilterView) {
        self.storeFilterView = storeFilterView
        self.addSubview(storeFilterView)
        self.storeFilterView!.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        storeFilterView.setFilterView(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showMenu() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
            self.storeFilterView!.frame = CGRect(x: self.storeFilterView!.frame.origin.x, y: -1000, width: self.storeFilterView!.frame.width, height: self.storeFilterView!.frame.height)
        }, completion: nil)

    }
    
}
