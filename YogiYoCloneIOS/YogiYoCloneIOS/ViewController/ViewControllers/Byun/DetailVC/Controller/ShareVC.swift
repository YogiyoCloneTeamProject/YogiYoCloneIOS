//
//  ShardVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ShareVC: UIViewController {
  
  let shareView = ShareView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = ColorPiker.customAlpha2
    shareViewFrame()
    print("뷰디드")
  }
  
  //MARK: -shareViewFrmae
  func shareViewFrame(){
    shareView.frame = CGRect(x: 20, y: 700, width: view.frame.width - 40, height: view.frame.height/3)
    view.addSubview(shareView)
    setUI()
  }
  
  
  //MARK: -viewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    UIView.animate(withDuration: 0.5, animations: {
      self.shareView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: self.view.frame.height/3)
      self.shareView.center = self.view.center
      self.setButton()
      self.constrain()
      print("윌")
    })
  }
  //MARK: -UI
  func setUI(){
    view.addSubview(cancelButton)
    view.addSubview(clipButton)
  }
  
   let cancelButton : UIButton = {
     let b  = UIButton()
     b.backgroundColor = .clear
     b.contentMode = .center
     return b
   }()
  
  let clipButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = .clear
    b.adjustsImageWhenHighlighted = false 
    b.contentMode = .scaleAspectFit
    return b
  }()
  
  
  //MARK: -Button
  func setButton(){
    cancelButton.addTarget(self, action: #selector(cancelDidTap(_:)), for: .touchUpInside)
    clipButton.addTarget(self, action: #selector(cilpdidTap(_:)), for: .touchUpInside)
  }
  
  @objc func cancelDidTap(_ sender: UIButton){
  cancelAnimation()
    dismiss(animated: true, completion: nil)
  }
  
  @objc func cilpdidTap(_ sender: UIButton){
    UIPasteboard.general.string = "https://apps.apple.com/kr/app/id543831532"
    print("클립이 복사되었습니다.")
    cancelAnimation()
    
    if let navi = self.presentingViewController as? UINavigationController, let vc = navi.viewControllers[0] as? DetailMenuVC {
          vc.clipAnimation()
    }
    dismiss(animated: true, completion: nil)
  }
  
  func cancelAnimation(){
     UIView.animate(withDuration: 0.4, animations: {
           self.shareViewFrame()
         })
   }
  
  //MARK: -constrain
  func constrain(){
    [cancelButton,clipButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
   
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalTo: shareView.leadingAnchor),
      cancelButton.heightAnchor.constraint(equalToConstant: 44),
      cancelButton.widthAnchor.constraint(equalTo: shareView.widthAnchor),
      cancelButton.bottomAnchor.constraint(equalTo: shareView.bottomAnchor),
      
      clipButton.centerXAnchor.constraint(equalTo: shareView.centerXAnchor, constant: 67),
      clipButton.widthAnchor.constraint(equalToConstant: 120),
      clipButton.heightAnchor.constraint(equalToConstant: 120),
      clipButton.centerYAnchor.constraint(equalTo: shareView.centerYAnchor),
    ])
  }
}

