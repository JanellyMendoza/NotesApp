//
//  MenuView.swift
//  NotesApp
//
//  Created by Angel Duarte on 13/03/24.
//

import Foundation
import UIKit

protocol MenuViewDelegate {
    
    func goToTask()
    func goToSearch()
    func goToRegister2()
}

enum MenuCases : String, CaseIterable{
  case 📱TAREAS
  case 💻REGISTRAR
  case 💿BUSCAR
  case 📷HISTORIAL
  case 📟EDITAR
}


class MenuView : UIView{
  
  var selectedButton: UIButton?
  var delegate : MenuViewDelegate?
  
  var backView : UIView = {
    var view = UIView()
    
    return view
  }()
  
  var personImage : UIImageView = {
    var image = UIImageView()
    image.clipsToBounds = true
    image.image = UIImage(named: "persona")
    return image
  }()
  
  var helloLabel : UILabel = {
    var label = UILabel()
    label.text = "HELLO"
    label.font = .systemFont(ofSize: 25)
    return label
  }()
  
  var personNameLabel : UILabel = {
    var label = UILabel()
    label.text = "Elon Musk"
    label.font = .boldSystemFont(ofSize: 25)
    return label
  }()
  
  var lineView : UIView = {
    var view = UIView()
    view.backgroundColor = .lightGray
    
    return view
  }()
  
  
  
  var menuView : UIView = {
    var view = UIView()
    return view
  }()
  
  
  var stackView : UIStackView = {
    var stack = UIStackView()
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fillEqually
    return stack
  }()
  
  init(){
    super.init(frame: .zero)
    self.backgroundColor = SColors.grisMenu
    initUI()
  }
  
  func initUI(){

    self.addSubview(backView)
    backView.addAnchorsWithMargin(0)
    
    backView.addSubview(personImage)
    personImage.addAnchorsAndSize(width: 80, height: 80, left: 20, top: 20, right: nil, bottom: nil)
    
    backView.addSubview(helloLabel)
    helloLabel.addAnchorsAndSize(width: 90, height: 30, left: 10, top: 35, right: nil, bottom: nil, withAnchor: .left, relativeToView: personImage)
    
    backView.addSubview(personNameLabel)
    personNameLabel.addAnchorsAndSize(width: 150, height: 30, left: 10, top: 65, right: nil, bottom: nil, withAnchor: .left, relativeToView: personImage)
    
    backView.addSubview(lineView)
    lineView.addAnchorsAndCenter(centerX: true, centerY: false, width: width * 0.712, height: 1, left: nil, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: personImage)
    
    backView.addSubview(menuView)
    menuView.addAnchorsAndCenter(centerX: true, centerY: false, width: width * 0.712, height: height / 2.5, left: nil, top: 30, right: nil, bottom: nil, withAnchor: .top, relativeToView: lineView)
    
    createMenuOptions()
    menuView.addSubview(stackView)
    stackView.addAnchorsWithMargin(5)
    
  }
  
  
  
  func createMenuOptions(){
    for option in MenuCases.allCases{
      let button = UIButton()
      button.setTitle(option.rawValue, for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .clear
      button.titleLabel?.font = .boldSystemFont(ofSize: 23)
      button.contentHorizontalAlignment = .center
      stackView.addArrangedSubview(button)
      
      switch option {
      case .📱TAREAS:
        button.addTarget(self, action: #selector(goTasks), for: .touchUpInside)
      case .💻REGISTRAR:
        button.addTarget(self, action: #selector(goRegister), for: .touchUpInside)
      case .💿BUSCAR:
        button.addTarget(self, action: #selector(goSearch), for: .touchUpInside)
      case .📷HISTORIAL:
        button.addTarget(self, action: #selector(goHistory), for: .touchUpInside)
      case .📟EDITAR:
        button.addTarget(self, action: #selector(goEdit), for: .touchUpInside)
      }
    }
  }
  
  
  @objc func goTasks(_ sender: UIButton){
    updateSelectedButton(sender)
    delegate?.goToTask()
  }
  
  @objc func goRegister(_ sender: UIButton){
    updateSelectedButton(sender)
    print("goRegister")
      delegate?.goToRegister2()
      
  }
  
  @objc func goSearch(_ sender: UIButton){
    updateSelectedButton(sender)
    print("goSearch")
      delegate?.goToSearch()
  }
  
  @objc func goHistory(_ sender: UIButton){
    updateSelectedButton(sender)
    print("goHistory")
  }
  
  @objc func goEdit(_ sender: UIButton){
    updateSelectedButton(sender)
    print("goEdit")
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func updateSelectedButton(_ newSelectedButton: UIButton) {
      selectedButton?.backgroundColor = .clear
      
      selectedButton = newSelectedButton

    selectedButton?.backgroundColor = SColors.verdeBoton
  }
  
}

