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



