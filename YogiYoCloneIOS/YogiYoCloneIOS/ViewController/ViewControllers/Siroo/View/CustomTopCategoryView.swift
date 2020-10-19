//
//  TopCategoryView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

protocol CustomTopCategoryViewDelegate : class {
    func categoryButtonScrollAction(to index: Int)
}
// drag >
class CustomTopCategoryView: UIView , StoreListVCDelegate, HistoryVCDelegate {
    func historyVCScrollIndex(to index: Int) {
        print("HistoryVCScroll : \(index)")
    }
    
    func scrollViewAction(to index: Int) {
        print("Scroll: \(index)")
    }
    

//    MARK: Properties
    
    private var categoryTitles: [String]!
    private var buttons : [UIButton] = []
    private var selectorView : UIView!
 

    
    var textColor: UIColor = ColorPiker.customDarkGray
    var selectorViewColor: UIColor = ColorPiker.customMainRed
    var selectorTextColor : UIColor = ColorPiker.customMainRed
    
    weak var delegate: CustomTopCategoryViewDelegate?
    
    public private(set) var selectedIndex : Int = 0

//    MARK:  init
    convenience init(frame: CGRect, categoryTitles: [String]) {
        self.init(frame: frame)
        self.categoryTitles = categoryTitles
        setButtonTitles(categoryTitles: categoryTitles)
    }
    
    func setButtonTitles(categoryTitles: [String]) {
        self.categoryTitles = categoryTitles
        self.updateView()
        
    }
    
    func setIndex(index: Int){
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(categoryTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    


//    MARK: Objc func
    
    @objc func buttonAction(sender: UIButton) {
//        self.storeVC.scrollViewMoveAction()
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition =
                    frame.width/CGFloat(categoryTitles.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.4) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
                delegate?.categoryButtonScrollAction(to: buttonIndex)
            }
        }
    }
    
    func indexChangedListener(_ index: Int) {
    //        self.storeVC.scrollViewMoveAction()
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if buttonIndex == index {
                let selectorPosition =
                    frame.width/CGFloat(categoryTitles.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }

}



//    MARK: configure extension

extension CustomTopCategoryView {

//    MARK: update
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }
    
//    MARK: Config
      
      private func configStackView() {
          let stack = UIStackView(arrangedSubviews: buttons)
          stack.axis = .horizontal
          stack.distribution = .fillEqually
          stack.alignment = .fill
        
          
          addSubview(stack)
          stack.snp.makeConstraints { (make) in
              make.top.bottom.leading.trailing.equalToSuperview()
          }
    
      }
      
      private func configSelectorView() {
          let selectorWidth = frame.width / CGFloat(self.categoryTitles.count)
          
          selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
          
          selectorView.backgroundColor = selectorViewColor
          addSubview(selectorView)
      }
      
      private func createButton() {
          buttons = [UIButton]()
          buttons.removeAll()
          subviews.forEach({$0.removeFromSuperview()})
          for categoryTitle in categoryTitles {
              let button = UIButton(type: .system)
              button.setTitle(categoryTitle, for: .normal)
              button.addTarget(self, action: #selector(CustomTopCategoryView.buttonAction(sender:)), for: .touchUpInside)
              
              button.setTitleColor(textColor, for: .normal)
              buttons.append(button)
          }
          
          buttons[0].setTitleColor(selectorTextColor, for: .normal)
      }
    

}





