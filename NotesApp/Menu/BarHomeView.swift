//
//  BarHomeView.swift
//  NotesApp
//
//  Created by Angel Duarte on 25/03/24.
//

import Foundation
import UIKit


class BarHomeView : UIView{
  
  
  var menuIcon : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "menu")
    image.backgroundColor = .clear
    image.contentMode = .scaleAspectFit
    image.isUserInteractionEnabled = true
    return image
  }()
  
  
  init(){
    super.init(frame: .zero)
  
    initUI()
    
  }
  
  
  func initUI(){
    self.addSubview(menuIcon)
    menuIcon.addAnchorsAndCenter(centerX: false, centerY: true, width: 40, height: 40, left: 10, top: nil, right: nil, bottom: nil)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapInMenu))
    menuIcon.addGestureRecognizer(tap)
  }
  
  @objc func tapInMenu(){
    print("Show or Hide Menu")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  

  
}
