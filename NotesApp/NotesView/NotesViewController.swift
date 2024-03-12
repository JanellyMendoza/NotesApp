//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Janelly on 04/03/24.
//

import UIKit

class NotesViewController: UIViewController {
  var viewModel : NotesViewModel!
  
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    initUI()
    
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
    
    func initUI(){
        view.addSubview(notesLabel)
        notesLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 100, height: 30, left: nil, top: 80, right: nil, bottom: nil)
        
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
