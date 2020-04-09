//
//  FilterViewController.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 08/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate: class {
    func filterViewControllerDidFilter(startDate: Date, endDate: Date, controller: UIViewController)
    func filterViewControllerDidClose(controller: UIViewController)
}

class FilterViewController: UIViewController {

    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var days: Int = 7
    
    var delegate: FilterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startDate.text = datePicker.date.formatterDateToString()
        updateEndDate()
    }
    
    func updateEndDate() {
        let end = Calendar.current.date(byAdding: .day, value: self.days, to: datePicker.date)
        self.endDate.text = end?.formatterDateToString()
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        
        self.startDate.text = datePicker.date.formatterDateToString()
        updateEndDate()
    }
    
    @IBAction func segmentControllChanged() {
        
        switch self.segmentControll.selectedSegmentIndex {
        case 0:
            self.days = 7
            updateEndDate()
        case 1:
            self.days = 30
            updateEndDate()
        case 2:
            self.days = 365
            updateEndDate()
        default:
            self.days = 7
            segmentControll.selectedSegmentIndex = 0
            updateEndDate()
        }
        
    }
    
    @IBAction func tapFilter() {
        delegate?.filterViewControllerDidFilter(startDate: (self.startDate.text?.formatterToDate())!, endDate: (self.endDate.text?.formatterToDate())!, controller: self)
    }
    
    @IBAction func close() {
        if let delegate = self.delegate {
            delegate.filterViewControllerDidClose(controller: self)
        }
    }
}
