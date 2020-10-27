//
//  MapTableViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//


import UIKit

extension MapVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if addressList.count != 0, !topView.searchField.isSelected {
            
            return addressList.count + 1
        } else {
            
            if addressData?.documents == nil {
                
                if topView.searchField.isSelected {
                    
                    return 1
                } else {
                    
                    return 1
                }
            } else {
                if addressData?.documents.count == 0 {
                    
                    return 2
                } else {
                    return (addressData?.documents.count ?? 0) + 1
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if addressList.count != 0, !topView.searchField.isSelected {
            
            return nearestCell(tableView: tableView, indexPath: indexPath)
        } else {
            
            if addressData?.documents == nil {
                if topView.searchField.isSelected {
                    
                    return explainCell(tableView: tableView, indexPath: indexPath)
                } else {
                    
                    return explainCell(tableView: tableView, indexPath: indexPath)
                }
            } else {
                
                return searchCell(tableView: tableView, indexPath: indexPath)
            }
        }
    }
    
    private func nearestCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestCustomCell.identifier) as? NearestCustomCell else { fatalError() }
            
            cell.setValue(text: "최근 주소")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestListCustomCell.identifier) as? NearestListCustomCell else { fatalError() }
            
            cell.removeButton.isHidden = false
            cell.setAddress(addressName: addressList[indexPath.row - 1].address,
                            roadAddress: addressList[indexPath.row - 1].load)
            return cell
        }
    }
    private func explainCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExplainCustomCell.identifier) as? ExplainCustomCell else { fatalError() }
        
        return cell
    }
    private func searchCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestCustomCell.identifier) as? NearestCustomCell else { fatalError() }
            
            if addressData?.documents.count == 0 {
                
                cell.setValue(text: "검색결과가 없습니다.")
            } else {
                
                cell.setValue(text: "'\(topView.searchField.text ?? "")'에 대한 검색 결과입니다.")
            }
            
            return cell
        } else {
            if addressData?.documents.count == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ExplainCustomCell.identifier) as? ExplainCustomCell else { fatalError() }
                
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestListCustomCell.identifier) as? NearestListCustomCell else { fatalError() }
                let data = addressData?.documents[indexPath.row - 1].roadAddress
                
                cell.removeButton.isHidden = true
                cell.setAddress(addressName: addressData?.documents[indexPath.row - 1].addressName ?? "",
                                roadAddress:"[도로명] \(data?.region1 ?? "") \(data?.region2 ?? "") \(data?.region3 ?? "")"
                )
                return cell
            }
        }
    }
}

