//
//  ShapeLayerView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class layerView: UIView {
  
  let laview = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    backgroundColor = .white
  }
  
  func setUI(){
  let rect = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 380, height: 1))
  let layer = CAShapeLayer()
  let path = UIBezierPath(roundedRect: rect, cornerRadius: 12)
  layer.path = path.cgPath
  layer.strokeColor = UIColor.red.cgColor;
  layer.lineDashPattern = [1,3]
  layer.backgroundColor = UIColor.clear.cgColor;
  layer.fillColor = UIColor.clear.cgColor
  self.layer.addSublayer(layer)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
