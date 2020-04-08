//
//  VisitorViewModel.swift
//  Portaria
//
//  Created by Marcio Habigzang Brufatto on 07/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorListViewModel {
    
    private var visitorBusinessProtocol: VisitorBusinessProtocol
    
    private var visitors: Results<Visitor>!

    init(visitorBusinessProtocol: VisitorBusinessProtocol) {
        self.visitorBusinessProtocol = visitorBusinessProtocol
        self.visitors = self.visitorBusinessProtocol.listVisitorDatabase()
    }
    
    func saveVisitor(_ isAddInContacts: Bool, visitor: Visitor) {
        self.visitorBusinessProtocol.save(isAddInContacts: isAddInContacts, visitor: visitor)
    }
    
    func numberOfVisitors() -> Int {
        return self.visitors.count
    }
    
    func visitorAt(index: Int) -> Visitor {
        return self.visitors[index]
    }
}




