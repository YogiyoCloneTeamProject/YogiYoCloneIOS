//
//  CollectionViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCV.collection:
            
            return category.item.count
        case fourthCV.collection:
            
            return 9
        default:
            
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = collectionView.tag
        
        switch collectionView {
        case categoryCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCustomCell.identifier,
                                                                for: indexPath) as? CategoryCustomCell else { fatalError() }
            item.setValue(image: category.item[indexPath.item].image,
                          title: category.item[indexPath.item].name)
            
            return item
            
        case firstCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)1") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: nil,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case twiceCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)2") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "♡ \(RecommendData.results[indexPath.item].bookmarkCount)",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case thirdCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.explanLabel.textColor = .systemRed
            loadData(url: "\(UrlBase.recomend)3") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "\(self.formatter.string(from: RecommendData.results[indexPath.item].deliveryDiscount as NSNumber) ?? "")원 할인",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: "배달비 무료")
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case fourthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TripleRestaurantCustomCell.identifier,
                                                                for: indexPath) as? TripleRestaurantCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)4") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  countText: "\(indexPath.item + 1)",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus,
                                  discountText: "\(self.formatter.string(from: RecommendData.results[indexPath.item].deliveryDiscount as NSNumber) ?? "")원 할인")
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case fifthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)5") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "배달비 무료",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: "최소주문 \(self.formatter.string(from: RecommendData.results[indexPath.item].minOrderPrice as NSNumber) ?? "")원")
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case sixthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)6") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: nil,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case seventhCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantPlusCustomCell.identifier,
                                                                for: indexPath) as? RestaurantPlusCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)7") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case eighthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.imageLabel.backgroundColor = .systemGreen
            loadData(url: "\(UrlBase.recomend)8") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: RecommendData.results[indexPath.item].deliveryTime,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        case ninthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantNewCustomCell.identifier,
                                                                for: indexPath) as? RestaurantNewCustomCell else { fatalError() }
            loadData(url: "\(UrlBase.recomend)9") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "NEW",
                                  title: RecommendData.results[indexPath.item].name,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                    self.collectionData[index] = RecommendData
                }
            }
            
            return item
            
        default:
            fatalError()
        }
    }
}
