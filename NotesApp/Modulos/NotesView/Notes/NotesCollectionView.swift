//
//  NotesCollectionView.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import UIKit

class NotesCollectionView: UIView{

  let dataBase = DataBase.shared
  
  var dataWorks = [TaskModel]()

  var collectionView : UICollectionView = {
    var layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 5
    layout.minimumInteritemSpacing = 5
    
    var collection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .clear
    
    return collection
  }()
  
  init(){
    super.init(frame: .zero)
    self.backgroundColor = .clear
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(NotesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    
    self.addSubview(collectionView)
    collectionView.addAnchorsWithMargin(0)
  }
  
  func getData(){
    
  }
  
}

extension NotesCollectionView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NotesCollectionViewCell
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: width - 20, height: height / 4)
  }
  
 /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }*/
  
  
}
