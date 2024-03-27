//
//  RegisterTaskViewController.swift
//  NotesApp
//
//  Created by Janelly on 11/03/24.
//

import UIKit
import Lottie

class RegisterTaskViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var viewModel: RegisterTaskViewModel!
    var priorityValidate: Priority? = nil
  
  var bandera = false
    
    var titleLabel : UILabel = {
        var label = UILabel()
        label.text = "Register"
        label.textColor = .systemYellow
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold Italic", size: 28)
        return label
    }()
    var addDescription : UILabel = {
        var label = UILabel()
        label.text = "Write anything"
        label.textColor = .systemYellow
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold Italic", size: 15)
        return label
    }()
    var addDate : UILabel = {
        var label = UILabel()
        label.text = "Write anything"
        label.textColor = .systemYellow
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold Italic", size: 15)
        return label
    }()

    
    var textFieldNameTask : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Name of your Task"
        textField.textColor = .black
        textField.font = UIFont(name: "Arial Bold Italic", size: 15)
        textField.backgroundColor = .white
        return textField
    }()
    var dateRegister: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        //region
        datePicker.locale = Locale.current
        datePicker.backgroundColor = .blue
        return datePicker
    }()
    var dateFinish: UIDatePicker = {
        var datePickerFinish = UIDatePicker()
        datePickerFinish .datePickerMode = .date
        datePickerFinish .locale = Locale.current
        datePickerFinish .backgroundColor = .blue
        return datePickerFinish
    }()
    
    var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.isScrollEnabled = true
        textView.textAlignment = .center
        textView.backgroundColor = .white
        return textView
    }()
    var priorityPicker : UIPickerView = {
        var picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    var saveButton: UIButton = {
        var button = UIButton()
        button.setTitle("Save Task", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 25
        return button
    }()
    var textFieldPriority : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Select your priority"
        textField.backgroundColor = .white
        return textField
    }()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        initUI()
        setupNavigation()
        let backButton = UIBarButtonItem()
            backButton.title = "Atrás"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationItem.hidesBackButton = false
        let backButton = UIBarButtonItem()
            backButton.title = "Atrás"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    func setupNavigation(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .cyan
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
    
    func initUI(){
        priorityPicker.delegate = self
        priorityPicker.dataSource = self
        let tap = UITapGestureRecognizer(target: self , action: #selector(showPriorityPicker))
        textFieldPriority.addGestureRecognizer(tap)
        
        view.addSubview(titleLabel)
        titleLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width, height: 30, left: nil, top: 15, right: nil, bottom: nil)
        
        view.addSubview(textFieldNameTask)
        textFieldNameTask.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 40, left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top, relativeToView: titleLabel)
        
        
        
        view.addSubview(addDescription)
        addDescription.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 40, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: textFieldNameTask)
        
        view.addSubview(descriptionTextView)
        descriptionTextView.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 80, left: nil, top: 15, right: nil, bottom: nil,withAnchor: .top, relativeToView: addDescription)
        
        view.addSubview(textFieldPriority)
        textFieldPriority.addAnchorsAndSize(width: 70, height: 40, left: 15, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: descriptionTextView)
        
      
        
        //view.addSubview(dateFinish)
        
    }
    @objc func showPriorityPicker(){
        view.addSubview(priorityPicker)
        priorityPicker.addAnchorsAndCenter(centerX: true, centerY: false, width: width, height: height / 3, left: nil, top: 30, right: nil, bottom: nil, withAnchor: .top, relativeToView: textFieldPriority)
        
        print("show")
    }
    @objc func saveTask(){
        
    }
    func validateInfo() -> Bool{
        guard let name = textFieldNameTask.text, !name.isEmpty else { return false }
        //guard let dateRegister = dateRegister.is
        guard let description = descriptionTextView.text, !description.isEmpty else {return false}
        if priorityValidate != nil {
            return true
        }
        return true
    }
    func validateIntervalDate(date : Date) -> Bool{
       var componentsMin = DateComponents()
       componentsMin.minute = 5
        let minDate : Date = Calendar.current.date(from: componentsMin) ?? Date.now
        
        if date > minDate {
          return true
        }
        
        return false
      }
}
extension RegisterTaskViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Priority.allCases.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Priority.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let prioritySelected = Priority.allCases[row]
           priorityValidate = prioritySelected
        textFieldPriority.text = priorityValidate?.rawValue
        print("seleccionaste \(row)")
        bandera = true
        priorityPicker.isHidden = true
    }
}
