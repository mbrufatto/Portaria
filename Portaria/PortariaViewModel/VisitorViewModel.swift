//
//  VisitorViewModel.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 07/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorViewModel {
    
    private var visitorBusinessProtocol: VisitorBusinessProtocol
    
    init(visitorBusinessProtocol: VisitorBusinessProtocol) {
        self.visitorBusinessProtocol = visitorBusinessProtocol
    }
    
    func listAllVisitor() -> Results<Visitor> {
        return self.visitorBusinessProtocol.listVisitorDatabase()
    }
    
    func saveVisitor(_ isAddInContacts: Bool, visitor: Visitor) {
        self.visitorBusinessProtocol.save(isAddInContacts: isAddInContacts, visitor: visitor)
    }
    
    //TODO add Filters
}
