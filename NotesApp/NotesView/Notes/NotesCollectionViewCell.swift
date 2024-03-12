//
//  NotesCollectionViewCell.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
  
  var status : UILabel = {
    var label = UILabel()
    label.textColor = .black
    label.backgroundColor = .red
    
    return label
  }()
  
  var priority : UILabel = {
    var label = UILabel()
    label.textColor = .black
    label.backgroundColor = .systemOrange
    
    return label
  }()
  
  
  var nameTask : UILabel = {
    var label = UILabel()
    label.textColor = .black
    label.backgroundColor = .red
    
    return label
  }()
  
  var descriptions : UILabel = {
    var label = UILabel()
    label.textColor = .black
    label.backgroundColor = .blue
    
    return label
  }()
  
  var dateCreate : UILabel = {
    var label = UILabel()
    label.textColor = .black
    label.backgroundColor = .red
    
    return label
  }()
  
  var dateFinish : UILabel = {
    var label = UILabel()
    label.textColor = .black
    label.backgroundColor = .blue
    
    return label
  }()
    
  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.backgroundColor = .clear
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    self.addSubview(status)
    status.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height * 0.035, left: nil, top: 0, right: nil, bottom: nil)
    
    self.addSubview(priority)
    priority.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height * 0.035, left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: status)
    
    self.addSubview(nameTask)
    nameTask.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height * 0.035, left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: priority)
    
    self.addSubview(descriptions)
    descriptions.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height * 0.07, left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: nameTask)
    
    self.addSubview(dateCreate)
    dateCreate.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height * 0.035, left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: descriptions)
    
    self.addSubview(dateFinish)
    dateFinish.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: height * 0.035, left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: dateCreate)
    
  }
  
}
