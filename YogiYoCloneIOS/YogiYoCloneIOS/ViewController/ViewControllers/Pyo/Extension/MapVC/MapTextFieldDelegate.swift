//
//  MapTextFieldDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension MapVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        topView.searchField.isSelected = true
        
        addressTableView.reloadData()
        
        UIView.animate(withDuration: 0.2) {
            self.topView.cancleButton.alpha = 1
            self.topView.constraint?
                .update(offset: -(self.topView.cancleButton.frame.width + CollectionDesign.padding * 2))
            self.topView.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
