//
//  ViewController.swift
//  PopupPickerViewDemo
//
//  Created by Ibraheem rawlinson on 8/15/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var daysTxtField: UITextField!
    @IBOutlet weak var monthsTxtField: UITextField!
    let pickerView = UIPickerView()
    
    // content for picker view
    let days = ["Mon","Tue","Wed", "Thur", "Fri", "Sat", "Sun"]
    let months = ["Jan", "Feb","Mar","Apr","May","June","July", "Aug", "Sept", "Oct", "Nov", "Dec"]
    
    // holds current content
    var currentArr = [String]()
    // holds curent text field
    var currentTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    
    private func callMethods(){
        setDelegate()
        setInputView()
        createToolBar()
    }
    private func setDelegate(){
        daysTxtField.delegate = self
        monthsTxtField.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    private func setInputView(){
        daysTxtField.inputView = pickerView
        monthsTxtField.inputView = pickerView
    }
    
    private func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneBttn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBttnPressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBttn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBttnPressed))
        toolBar.setItems([cancelBttn,flexSpace,doneBttn], animated: false)
        
        daysTxtField.inputAccessoryView = toolBar
        monthsTxtField.inputAccessoryView = toolBar
        
    }
    
    @objc private func doneBttnPressed(){
        
        currentTxtField.resignFirstResponder()
    }
    @objc private func cancelBttnPressed(){
        currentTxtField.text = ""
        currentTxtField.resignFirstResponder()
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTxtField = textField
        switch textField {
        case daysTxtField:
            currentArr = days
        case monthsTxtField:
            currentArr = months
        default:
            print("Detfault")
        }
        pickerView.reloadAllComponents()
        return true
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return currentArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let myTitle = currentArr[row]
       return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected item is ", currentArr[row])
        currentTxtField.text = currentArr[row]
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    
}
