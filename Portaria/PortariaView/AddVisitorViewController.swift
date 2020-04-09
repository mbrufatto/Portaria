//
//  AddVisitorViewController.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import UIKit

protocol AddVisitorViewControllerDelegate {
    func addVisitorViewControllerDidSave(isAddInContacts: Bool, visitor: Visitor, controller: UIViewController)
    func addVisitosViewControllerDidClose(controller: UIViewController)
}

class AddVisitorViewController: UIViewController {
    
    @IBOutlet weak var visitorName: UITextField!
    @IBOutlet weak var visitorPhone: UITextField!
    @IBOutlet weak var visitorResponsibleAccess: UITextField!
    @IBOutlet weak var visitorCategory: UITextField!
    @IBOutlet weak var isAddInContacts: UISwitch!
    
    private var addVisitorViewModel = AddVisitorViewModel()
    
    var delegate: AddVisitorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        visitorCategory.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        visitorCategory.inputAccessoryView = toolBar
    }
    
    @objc func action() {
       view.endEditing(true)
    }
    
    @IBAction func save() {
        
        let delegate = self.delegate
        
        let visitor = Visitor()
        visitor.name = self.visitorName.text
        visitor.phone = self.visitorPhone.text
        visitor.responsibleAccess = self.visitorResponsibleAccess.text
        visitor.category = self.visitorCategory.text!
        
        delegate?.addVisitorViewControllerDidSave(isAddInContacts: self.isAddInContacts.isOn, visitor: visitor, controller: self)
    }
    
    @IBAction func close() {
        if let delegate = self.delegate {
            delegate.addVisitosViewControllerDidClose(controller: self)
        }
    }
}


extension AddVisitorViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.addVisitorViewModel.numberOfCategory()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.addVisitorViewModel.categoryAt(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.visitorCategory.text = addVisitorViewModel.categoryAt(index: row)
    }
}
