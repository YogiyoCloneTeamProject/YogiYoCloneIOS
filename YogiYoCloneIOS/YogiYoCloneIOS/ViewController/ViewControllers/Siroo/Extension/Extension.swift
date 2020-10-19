//
//  Extension.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

var isOn = true

extension UIView {
    
    func inputContainerView(image: UIImage, textField: UITextField? = nil, segmentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        if let textField = textField {
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24 , height: 24)
            
            view.addSubview(textField)
            textField.centerY(inView: view)
            textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBotton:  8)
        }
        
        if let sc = segmentedControl {
            imageView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop:  -8 ,paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(sc)
            sc.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight:  8 )
            sc.centerY(inView: view, constant: 8)
            
        }
        
        
        
        // 로그인 아래 선
        
        
        let seperateView = UIView()
        seperateView.backgroundColor = .lightGray
        view.addSubview(seperateView)
        seperateView.anchor(left: view.leftAnchor, bottom:  view.bottomAnchor, right: view.rightAnchor, paddingLeft:
                                9, height: 0.75)
        
        return view
        
    }
    //nil 값을 준이유: 각 ui 마다 필요한 anchor를 제외하고는 값을 따로 주지 않아도 되는 경우가 있는데 이 경우를 위해 nil 값으로 설정
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBotton: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        // 화면상에서 + 하게 되면 왼쪽화면을 기준으로 화면에서 보이지 않는 왼쪽으로 향하기 때문에 - 해야함!
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBotton).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    func centerX(inView view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView , leftAnchor: NSLayoutXAxisAnchor? = nil ,paddingLeft: CGFloat = 0 ,constant: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: leftAnchor, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func addShadow() {
        //LocationIndicator 아래 그림자 만들어서 떠있는 것처럼 구현
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
    
    func filterButtonclicked(_ sender: UIButton){
        var isOn = true
        let button = UIButton()

        if isOn == true {
            isOn = false
            button.setTitleColor( .darkGray, for: .normal)
            button.setImage(UIImage(systemName: "circle"), for: .normal)
            button.tintColor = .darkGray
        } else {
            isOn = true
            button.setTitleColor(.red, for: .normal)
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            button.tintColor = .red
            
        }
      
    
    
}
    
}



