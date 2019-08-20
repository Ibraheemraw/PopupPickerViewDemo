//
//  DatePickerController.swift
//  PopupPickerViewDemo
//
//  Created by Ibraheem rawlinson on 8/20/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {

    @IBOutlet weak var textF: UITextField!
    var dp: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dp = UIDatePicker()
        dp?.datePickerMode = .date
        dp?.addTarget(self, action: #selector(DatePickerController.dateValueChanged), for: .valueChanged)
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(DatePickerController.viewTapped))
        view.addGestureRecognizer(tapGest)
        textF.inputView = dp
    }
    @objc private func dateValueChanged(_ datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        textF.text = dateFormatter.string(from: datePicker.date)
        print(textF.text!)
        view.endEditing(true)
    }
    @objc private func viewTapped(){
        
        view.endEditing(true)
    }
    

    

}
