//
//  UITableViewDataSource.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


//MARK: -numberOfRowsInSection
extension DetailMenuVC: UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    3 + (data?.optionGroup.count ?? 0)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 { //이미지,할인,메뉴명,상세,리뷰
      return 5
      
    }else if section == 1 { //가격
      return 1
      
    } else if section == 2 + (data?.optionGroup.count ?? 0) { //수량
      return 2
      
    }else {
      return data == nil ? 0 : data!.optionGroup[section - 2]!.option.count + 1
    }
  }
  
  //MARK:- cellForRowAt
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 0:
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        let images = [data == nil ? "" : data!.image]
        imageCell.detailmenuImage.kf.setImage(with: URL(string: images[0]))
        return imageCell
        
      case 1:
        let saleCell = tableView.dequeueReusableCell(withIdentifier: "SaleTableViewCell", for: indexPath) as! SaleTableViewCell
        return saleCell
        
      case 2:
        let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
        nameCell.detailmenuName.text = "\(data == nil ? "" : data!.name)"
        return nameCell
        
      case 3:
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        detailCell.detailmenuRemark.text = "\(data == nil ? "" : data!.caption)"
        return detailCell
        
      default:
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        return reviewCell
      }
    //주메뉴가격
    case 1:
      let costCell = tableView.dequeueReusableCell(withIdentifier: "CostTableViewCell", for: indexPath) as! CostTableViewCell
      costCell.costLableWon.text = "\(data == nil ? 0 : data!.price)원"
      return costCell
     
    //토탈가격
    case 2 + (data?.optionGroup.count ?? 0):
      switch indexPath.row {
      case 0:
        let buyCell = tableView.dequeueReusableCell(withIdentifier: "BuyTableViewCell", for: indexPath) as! BuyTableViewCell
        buyCell.delegate = self
        return buyCell
        
      default:
        let buyLastCell = tableView.dequeueReusableCell(withIdentifier: "BuyLastTableViewCell", for: indexPath) as! BuyLastTableViewCell
        buyLastCell.costLable.text = "\(String(totalPrice()))원"
        return buyLastCell
      }
      
    default:
      let menuItem = data!.optionGroup[indexPath.section - 2]!
      
      switch indexPath.row {
      case 0:
        switch menuItem.mandatory {
        case false:
          let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
          menuCell.menuLable.text = menuItem.name
        //  menuCell.delegate = self
          return menuCell
          
        case true :
          let optionCell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
          optionCell.optionLable.text = menuItem.name

          return optionCell
        }
        
      default:
        let menuOption = menuItem.option[indexPath.row - 1]
        
        switch menuItem.mandatory {
        case false:
          let listMCell = tableView.dequeueReusableCell(withIdentifier: "ListMenuTableViewCell", for: indexPath) as! ListMenuTableViewCell
          listMCell.selectLable.text = "\(menuOption.name)"
          listMCell.costLabel.text = "+ \(menuOption.price)원"
          listMCell.delegate = self
          return listMCell
          
        case true :
          let listOPCell = tableView.dequeueReusableCell(withIdentifier: "ListOptionTableViewCell", for: indexPath) as! ListOptionTableViewCell
          listOPCell.selectLable.text = "\(menuOption.name)"
          listOPCell.costLabel.text = "+ \(menuOption.price)원"
          listOPCell.selectButton.tag = indexPath.row
          listOPCell.checkOn = menuOption.selectPos
          listOPCell.delegate = self
          
          return listOPCell
        }
      }
    }
  }
  //MARK:- total
  func totalPrice() -> Int{
    var total = 0
    print("오더리스트갯수 확인: ", orderlist?.count)
    
    let price = (orderlist?.price) ?? 0
    let count = (orderlist?.count) ?? 0
    total += price * count
    orderlist?.option.forEach{
        total += $0.price
      }
    orderlist?.totalPrice = total
    
    return total
  }
  
}
