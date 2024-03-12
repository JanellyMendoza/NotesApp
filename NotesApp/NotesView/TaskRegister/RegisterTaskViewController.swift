//
//  RegisterTaskViewController.swift
//  NotesApp
//
//  Created by Janelly on 11/03/24.
//

import UIKit

class RegisterTaskViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var viewModel: RegisterTaskViewModel!
    
    
    var titleLabel : UILabel = {
        var label = UILabel()
        label.text = "Register"
        label.textColor = .systemYellow
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold Italic", size: 28)
        return label
    }()
    var textFieldNameTask : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Name of your Task"
        textField.backgroundColor = .white
        return textField
    }()
    var dateRegister: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    func initUI(){
        priorityPicker.delegate = self
        priorityPicker.dataSource = self
        
    }
    @objc func saveTask(){
        
    }
    func validateData() -> TaskModel?{
       // guard let name = textFieldUser.text, !name.isEmpty else { return nil }
       // guard let dateRegister =
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
        print("seleccionaste \(row)")
    }
}
