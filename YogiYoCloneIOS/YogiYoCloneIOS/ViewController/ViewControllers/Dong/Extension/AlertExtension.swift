//
//  AlertExtension.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alertNormal(title: String? = nil, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: handler)
        let cancel = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

}
