//
//  UITableViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIkit

//MARK:-UITableViewDelegate
extension OderVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    Path)
    guard let cell = tableView.cellForRow(at: indexPath) as? CustomOrderCell else {return}
    guard let index = tableView.indexPath(for: cell) else { return }
    
    
    //MARK:- pikerView
    if indexPath.section == 1 && indexPath.row == 1 {
      pikerView.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
      pikerView.backgroundColor = .white
      self.view.addSubview(pikerView)
      
      toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
      toolBar.barStyle = .default
      toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
      self.view.addSubview(toolBar)
      
    }
    
  }
  
  @objc func onDoneButtonTapped() {
  //  pikerView.reloadAllComponents()
    toolBar.removeFromSuperview()
    pikerView.removeFromSuperview()
    
  }
  
  //헤더
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    section == 0 ? " " : " "
  }
  
  //푸터뷰 높이
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    switch section{
    case 0:
      return 1
    case 1:
      return 10
    case 2:
      return 0
    case 3:
      return 10
    case 4:
      return 0
    default:
      return 0
    }
    
  }
}





