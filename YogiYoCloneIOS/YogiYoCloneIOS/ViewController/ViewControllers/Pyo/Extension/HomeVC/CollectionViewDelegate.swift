//
//  CollectionViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCV.collection {

            guard indexPath.item == 1 || indexPath.item == 2 else {

                let listVC = StoreListVC()
                indexPath.item < 3 ? (listVC.categoryIndex = indexPath.item) : (listVC.categoryIndex = indexPath.item - 2)
                navigationController?.pushViewController(listVC, animated: true)

                return
            }

            switch indexPath.item {
            case 1:
                let plusVC = YogiyoPlusStoreListVC()
                navigationController?.pushViewController(plusVC, animated: true)
            case 2:
                print("take out")
            default:
                fatalError()
            }
        } else {
            
            return pushStore(store: collectionData[collectionView.tag]?.results[indexPath.item].id ?? 0)
        }
    }
}
