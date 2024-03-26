//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Janelly on 04/03/24.
//

import UIKit

class NotesViewController: UIViewController {
  var viewModel : NotesViewModel!
  
  
  var menuView = MenuView()
  
  var barHome : BarHomeView = {
    var bar = BarHomeView()
    bar.backgroundColor = .systemMint
    return bar
  }()
  
  var notesLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .systemOrange
    label.text = "NOTAS"
    label.textAlignment = .center
    label.textColor = .white
    label.clipsToBounds = true
    label.layer.cornerRadius = 15
    label.font = .systemFont(ofSize: 20)
    
    return label
    
  }()
  
  var addTaskButton : UIButton = {
    var button = UIButton()
    button.setImage(UIImage(named: "plus"), for: .normal)
    button.tintColor = .black
    
    return button
  }()
  
  var collectionViewNotes : NotesCollectionView = {
    var collection = NotesCollectionView()
    
    return collection
  }()
  
  var menuWidth = 250.0
  var isMenuOpen : Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    initUI()
    setUpLateralMenu()
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavigation()
    self.navigationController?.navigationBar.isHidden = false
    self.navigationController?.navigationBar.isTranslucent = false
    self.navigationController?.navigationItem.hidesBackButton = false
    
    
  }
  func setupNavigation(){
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .red
    self.navigationController?.navigationBar.standardAppearance = appearance;
    self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
  }
  
  
  func setUpLateralMenu(){
    
    menuView.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: height)
    view.addSubview(menuView)
    
    
    let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_ :)))
    view.addGestureRecognizer(swipeGesture)
  }
  
  func showMenu(){
    UIView.animate(withDuration: 0.3, animations: {
      self.menuView.frame.origin.x = 0
    })
    isMenuOpen = true
  }
  
  func hideMenu(){
    UIView.animate(withDuration: 0.3, animations: {
      self.menuView.frame.origin.x = -self.menuWidth
    })
    isMenuOpen = false
  }
  
  
  @objc func handleSwipeGesture(_ gesture : UIPanGestureRecognizer){
    let gestureVelocity = gesture.velocity(in: view).x
    
    switch gesture.state {
    case .began:
      if !isMenuOpen && gestureVelocity > 0 {
        showMenu()
      }
    case .changed:
      let translation = gesture.translation(in: view)
      var newOriginX = menuView.frame.origin.x + translation.x
      newOriginX = max(-menuWidth, newOriginX)
      newOriginX = min(0, newOriginX)
      menuView.frame.origin.x = newOriginX
      gesture.setTranslation(CGPoint.zero, in: view)
    case .ended:
      if isMenuOpen && gestureVelocity < -500.0{
        hideMenu()
      }else if !isMenuOpen && gestureVelocity > 500{
        showMenu()
      }else{
        if isMenuOpen{
          showMenu()
        }else{
          hideMenu()
        }
      }
    default:
      break
    }
  }
  
  
  
  func initUI(){
    view.addSubview(barHome)
    barHome.addAnchorsAndSize(width: nil, height: 50, left: 0, top: 0, right: 0, bottom: nil)
    
    view.addSubview(notesLabel)
    notesLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 100, height: 30, left: nil, top: 140, right: nil, bottom: nil)
    
    addTaskButton.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
    view.addSubview(addTaskButton)
    addTaskButton.addAnchorsAndSize(width: 20, height: 20, left: 5, top: 85, right: nil, bottom: nil, withAnchor: .left, relativeToView: notesLabel)
    
    
    view.addSubview(collectionViewNotes)
    collectionViewNotes.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height - 100, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: notesLabel)
  }
  
  @objc func goToRegister(){
    viewModel.goToRegister()
  }
  
}
