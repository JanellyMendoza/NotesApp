//
//  MenuView.swift
//  NotesApp
//
//  Created by Angel Duarte on 13/03/24.
//

import Foundation
import UIKit



enum MenuCases : String, CaseIterable{
  case Tareas
  case Registrar
  case Buscar
  case Historial
}


class MenuView : UIView{
  
  var backView : UIView = {
    var view = UIView()
    view.backgroundColor = .gray
    view.alpha = 0.6
    return view
  }()
  
  
  var menuView : UIView = {
    var view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  
  var stackView : UIStackView = {
    var stack = UIStackView()
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.backgroundColor = .purple
    return stack
  }()
  
  init(){
    super.init(frame: .zero)
    initUI()
  }
  
  func initUI(){
    self.backgroundColor = .clear
    
    self.addSubview(backView)
    backView.addAnchorsWithMargin(0)
    
    self.addSubview(menuView)
    menuView.addAnchorsAndSize(width: width / 2, height: height / 4 , left: 0, top: 50, right: nil, bottom: nil)
    
    createMenuOptions()
    menuView.addSubview(stackView)
    stackView.addAnchorsWithMargin(5)
    
  }
  
  
  
  func createMenuOptions(){
    for option in MenuCases.allCases{
      let button = UIButton()
      button.setTitle(option.rawValue, for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.backgroundColor = .cyan
      button.contentHorizontalAlignment = .left
      stackView.addArrangedSubview(button)
      
      switch option {
      case .Tareas:
        button.addTarget(self, action: #selector(goTasks), for: .touchUpInside)
      case .Registrar:
        button.addTarget(self, action: #selector(goRegister), for: .touchUpInside)
      case .Buscar:
        button.addTarget(self, action: #selector(goSearch), for: .touchUpInside)
      case .Historial:
        button.addTarget(self, action: #selector(goHistory), for: .touchUpInside)
      }
    }
  }
  
  
  @objc func goTasks(){
    print("goTasks")
  }
  
  @objc func goRegister(){
    print("goRegister")
  }
  
  @objc func goSearch(){
    print("goSearch")
  }
  
  @objc func goHistory(){
    print("goHistory")
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

