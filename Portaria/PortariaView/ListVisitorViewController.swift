//
//  ListVisitorViewController.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 07/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class ListVisitorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var visitorViewModel = VisitorListViewModel(visitorBusinessProtocol: VisitorBusiness())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = false
        
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addVisitorSegue" {
        
            guard let navigationController = segue.destination as? UINavigationController, let addVisitorViewController = navigationController.viewControllers.first as? AddVisitorViewController else {
                fatalError("Error performing segue!")
            }
        
            addVisitorViewController.delegate = self
        } else if segue.identifier == "filterVisitorSegue" {
            
            guard let navigationController = segue.destination as? UINavigationController, let filterViewController = navigationController.viewControllers.first as? FilterViewController else {
                    fatalError("Error performing segue!")
            }
            filterViewController.delegate = self
        }
    }
}

extension ListVisitorViewController: UITableViewDelegate {
    
}

extension ListVisitorViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.visitorViewModel.numberOfVisitors()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "visitorCell", for: indexPath)
        let visitor = self.visitorViewModel.visitorAt(index: indexPath.row)
        
        if visitor.endDateAndHour == nil {
            cell.textLabel?.textColor = .red
            cell.detailTextLabel?.textColor = .red
        }
        
        cell.textLabel?.text = visitor.name
        cell.detailTextLabel?.text = visitor.category
        
        return cell
    }
}

extension ListVisitorViewController: AddVisitorViewControllerDelegate {
    
    func addVisitorViewControllerDidSave(isAddInContacts: Bool, visitor: Visitor, controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
        self.visitorViewModel.saveVisitor(isAddInContacts, visitor: visitor)
        
        self.tableView.reloadData()
    }
    
    func addVisitosViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ListVisitorViewController: FilterViewControllerDelegate {
    
    func filterViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func filterViewControllerDidFilter(startDate: Date, endDate: Date, controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
        self.visitorViewModel.filterVisitors(startDate: startDate, endDate: endDate)
        self.tableView.reloadData()
    }
}

