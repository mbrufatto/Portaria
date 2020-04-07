//
//  VisitorTest.swift
//  PortariaTests
//
//  Created by Marcio Habigzang Brufatto on 07/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import XCTest
@testable import Portaria

class VisitorTest: XCTestCase {
    
    func testAddVisitorOnlyDataBase() {
        
        //Given
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = .serviceProvider
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: false, visitor: visitor)
        
        //Then
        let visitorDatabase = visitorBusiness.searchVisitorInDataBaseByName(visitor.name)
        XCTAssertEqual(visitorDatabase.name, visitor.name)
        
        visitorBusiness.deleteVisitorInDatabase(visitor: visitor)
    }
    
    func testAddVisitorInDataBaseAndContacts() {
        //Given
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = .serviceProvider
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: true, visitor: visitor)
        
        //Then
        let visitorDatabase = visitorBusiness.searchVisitorInDataBaseByName(visitor.name)
        XCTAssertEqual(visitorDatabase.name, visitor.name)
        
        let contact = visitorBusiness.searchVisitorInContactsByName(visitor.name)
        XCTAssertEqual(contact.name, visitor.name)
        
        visitorBusiness.deleteVisitorInContacts(visitor.name)
        visitorBusiness.deleteVisitorInDatabase(visitor: visitor)
    }
}
