//
//  BottomStack.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class BottomStack: UIView {
    
    private let motherStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    private let firstStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    
    private let twiceStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button4 = UIButton()
    private let button5 = UIButton()
    private let button6 = UIButton()
    
    private let thirdStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button7 = UIButton()
    private let button8 = UIButton()
    private let button9 = UIButton()
    
    private let fourthStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button10 = UIButton()
    private let button11 = UIButton()
    private let button12 = UIButton()
    
    private let fifthStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button13 = UIButton()
    private let button14 = UIButton()
    private let button15 = UIButton()
    
    lazy var buttons = [button1, button2, button3, button4, button5,
                        button6, button7, button8, button9, button10,
                        button11, button12, button13, button14, button15]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(motherStackView)
        
        motherStackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        setStackUI()
    }
    private func setStackUI() {
        
        var index = 0
        [button1, button2, button3, button4, button5,
         button6, button7, button8, button9, button10,
         button11, button12, button13, button14, button15].forEach {
            $0.backgroundColor = .systemBackground
            $0.setTitleColor(.black, for: .normal)
            $0.setTitle(category.item[index].name, for: .normal)
            $0.titleLabel?.font = UIFont(name: FontModel.customLight, size: 14)
            $0.tag = index
            index += 1
        }
        
        [button1, button2, button3].forEach {
            firstStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(firstStack)
        
        [button4, button5, button6].forEach {
            twiceStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(twiceStack)
        
        [button7, button8, button9].forEach {
            thirdStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(thirdStack)
        
        [button10, button11, button12].forEach {
            fourthStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(fourthStack)
        
        [button13, button14, button15].forEach {
            fifthStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(fifthStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
