//
//  NotesCollectionView.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import UIKit

class NotesCollectionView: UIView{


  var collectionView : UICollectionView = {
    var layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    
    var collection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .white
    
    return collection
  }()
  
  init(){
    super.init(frame: .zero)
    self.backgroundColor = .blue
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
  
}

extension NotesCollectionView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    <#code#>
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    <#code#>
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    <#code#>
  }
  
  
}
