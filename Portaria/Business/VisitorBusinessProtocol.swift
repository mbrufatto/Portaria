//
//  VisitorProtocol.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 03/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import RealmSwift

protocol VisitorBusinessProtocol {
    
    func save(isAddInContacts: Bool, visitor: Visitor)
    
    func listVisitorDatabase() -> Results<Visitor>
    
    func searchVisitorInContactsByName(_ visitorName: String) -> Visitor
    
    func searchVisitorInDataBaseByName(_ visitorName: String) -> Visitor
    
    func deleteVisitorInDatabase(visitor: Visitor)
    
    func deleteVisitorInContacts(_ visitorName: String)
    
    func filterVisitors(startDate: Date, endDate: Date) -> Results<Visitor>
}
