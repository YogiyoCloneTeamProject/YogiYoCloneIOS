//
//  DataModel.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation

struct RecommendData: Codable {
    
    let results: [Results]
    
    
    struct Results: Codable {
        
        let id: Int
        let name: String
        let star: Double
        let image: String
        
        let deliveryDiscount: Int
        let deliveryCharge: Int
        let deliveryTime: String
        
        let bookmarkCount: Int
        let reviewCount:Int
        
        let representativeMenus: String
        let minOrderPrice:Int
        
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            case bookmarkCount = "bookmark_count"
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case minOrderPrice = "min_order_price"
        }
    }
}


struct LikeData: Codable {
    
    let next: String?
    let previous: String?
    let results: [Results]
    
    
    struct Results: Codable {
        
        let id: Int
        let name: String
        let star: Double
        let image: String
        
        let deliveryDiscount: Int
        let deliveryCharge: Int
        let deliveryTime: String
        
        let reviewCount:Int
        let representativeMenus: String
        let ownerCommentCount:Int?
        
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case ownerCommentCount = "owner_comment_count"
        }
    }
}
struct SearchData : Codable{
  let id : Int?
  let name : String?

  init(id: Int, name: String) {
        self.id = id
        self.name = name
}
  enum CodingKeys: String, CodingKey {
      case id = "id"
      case name = "name"
}
}
struct DidSearchData: Codable {
    
    let next: String?
    let previous: String?
    var results: [Results]?
    
    
    struct Results: Codable {
        
        let id: Int?
        let name: String?
        let star: Double?
        let image: String?
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int?
        let deliveryTime: String?
        
        let reviewCount:Int?
        let representativeMenus: String?
        let ownerCommentCount:Int?
        
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case ownerCommentCount = "owner_comment_count"
        }
    }
}
struct SearchDataload: Codable {
    
    let next: String?
    let previous: String?
    var results: [Results]?
    
    
    struct Results: Codable {
        
        let id: Int?
        let name: String?
        let star: Double?
        let image: String?
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int?
        let deliveryTime: String?
        
        let reviewCount:Int?
        let representativeMenus: String?
        let ownerCommentCount:Int?
        
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case ownerCommentCount = "owner_comment_count"
        }
    }
}


struct AllListData: Codable {
    
    let next: String?
    let previous: String?
    let results: [Results]
    
    struct Results: Codable {
        
        let id: Int
        let name: String
        let averageRating: Double
        let image: String
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int
        let deliveryTime: String
        let reviewCount: Int
        let representativeMenus: [String]
        
        enum CodingKeys: String, CodingKey {
            case id, name, image
            case averageRating = "average_rating"
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
        }
        
    }
}


struct RestaurantInstanceData: Codable {
    
    let id: Int
    let name: String
    
    let averageRating: Double
    let averageTaste: Double
    let averageDelivery: Double
    let averageAmount: Double
    
    let image: String
    let backImage: String?
    
    let notification: String
    let openingTime: String
    let closingTime: String
    let telNumber: String
    let address: String
    
    let minOrder: Int
    let paymentMethods: [String]
    
    let businessName: String
    let companyRegistrationNumber: String
    let originInformation: String
    
    let deliveryDiscount: Int
    let deliveryCharge: Int
    let deliveryTime: String
    
    //    let lat: Double
    //    let lng: Double
    
    
    let photoMenu: [PhotoMenu]
    let menuGroup: [MenuGroup]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, notification, address
        
        case averageRating = "average_rating"
        case averageTaste = "average_taste"
        case averageDelivery = "average_delivery"
        case averageAmount = "average_amount"
        
        case backImage = "back_image"
        
        case openingTime = "opening_time"
        case closingTime = "closing_time"
        case telNumber = "tel_number"
        case minOrder = "min_order_price"
        case paymentMethods = "payment_methods"
        case businessName = "business_name"
        case companyRegistrationNumber = "company_registration_number"
        case originInformation = "origin_information"
        case deliveryDiscount = "delivery_discount"
        case deliveryCharge = "delivery_charge"
        case deliveryTime = "delivery_time"
        
        case photoMenu = "photo_menu"
        case menuGroup = "menu_group"
    }
}

struct PhotoMenu: Codable {
    
    let id: Int
    let name: String
    let image: String
    let caption: String
    let menuGroupID: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, caption, price
        case menuGroupID = "menu_group_id"
    }
    
}

struct MenuGroup: Codable {
    
    let name: String
    var menu: [Menu]
    
    
}

struct Menu: Codable {
    
    let id: Int
    let name: String
    let image: String?
    
    let caption: String
    let menuGroupId: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, caption, price
        case menuGroupId = "menu_group_id"
    }
    
}

struct MenuData: Codable {
    
    let id: Int
    let name: String
    let image: String
    let caption: String
    let price: Int
    var optionGroup: [OptionGroup?]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, caption, price
        case optionGroup = "option_group"
    }
    
    
    struct OptionGroup: Codable {
        
        let id: Int
        let name: String
        let menuId: Int
        
        let mandatory: Bool
        var option: [Option]
        
        enum CodingKeys: String, CodingKey {
            case id, name, mandatory, option
            case menuId = "menu_id"
        }
        
        struct Option: Codable {
            
            let id: Int
            let name: String
            let price: Int
            let optionGroupId: Int
            var selectPos: Bool = false
            
            enum CodingKeys: String, CodingKey {
                case id, name, price
                case optionGroupId = "option_group_id"
            }
        }
    }
}



struct OrderData: Codable {
    var menu: Int
    var name: String
    var count: Int
    var price: Int
    var option: [Option] = []
    var totalPrice: Int?
  init(menu: Int, name: String, count: Int, price: Int) {
        self.name = name
        self.menu = menu
        self.count = count
        self.price = price
        //self.option = option //초기화될경우 nil됨 ?때문에
    }
    struct Option: Codable {
      let id: Int
      let name: String
      let price: Int
      let optionGroupId: Int
      var selectPos: Bool = false
      enum CodingKeys: String, CodingKey {
          case id, name, price
          case optionGroupId = "option_group_id"
      }
  }
}
   
struct OrderListData : Codable {
        let next: String?
        let previous: String?
        let results: [Results]
        
        struct Results: Codable {
            
            let id: Int
            let orderMenu: String
            let restautantName: String
            let restautantImage: String
            let status : String
            let orderTime : String
            let reviewWritten : Bool
            
            enum CodingKeys: String, CodingKey {
                case id, status
                case orderMenu = "order_menu"
                case restautantName = "restaurant_name"
                case restautantImage = "restaurant_image"
                case orderTime = "order_time"
                case reviewWritten = "review_written"
            }
        }
    }


struct UrlBase {
        
        
        static let ip = "http://52.79.251.125/"
        
        static let recomend = "restaurants/home_view_"
        static let bookmarks = "bookmarks"
        
        static let listAll = "restaurants"
        static let category = "categories"
        static let instance = "restaurants/"
        
        static let menu = "menu/"
        
        static let payment = "payment_methods"
        
        static let ordering = "ordering"
        
        
        static let restaurantList = "http://52.79.251.125/restaurants"
        static let restaurantInstance = "http://52.79.251.125/restaurants/2"
        
        static let menuInstance = "http://52.79.251.125/menu/2"
        static let order = "http://52.79.251.125/orders"
        
        
        
        static var lat = "37.545258"
        static var lon = "127.057174"
    }
