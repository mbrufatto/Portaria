//
//  VisitorTest.swift
//  PortariaTests
//
//  Created by Marcio Habigzang Brufatto on 07/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Portaria

class VisitorTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func testAddVisitorOnlyDataBase() {
        
        //Given
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = "Prestador de Serviço"
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: false, visitor: visitor)
        
        //Then
        let visitorDatabase = visitorBusiness.searchVisitorInDataBaseByName(visitor.name)
        XCTAssertEqual(visitorDatabase.name, visitor.name)
        
        let contact = visitorBusiness.searchVisitorInContactsByName(visitor.name)
        XCTAssertEqual(contact.name, "")
        
//        visitorBusiness.deleteVisitorInDatabase(visitor: visitor)
    }
    
    func testAddVisitorInDataBaseAndContacts() {
        //Given
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = "Prestador de Serviço"
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: true, visitor: visitor)
        
        //Then
        let visitorDatabase = visitorBusiness.searchVisitorInDataBaseByName(visitor.name)
        XCTAssertEqual(visitorDatabase.name, visitor.name)
        
        let contact = visitorBusiness.searchVisitorInContactsByName(visitor.name)
        XCTAssertEqual(contact.name, visitor.name)
        
        visitorBusiness.deleteVisitorInContacts(visitor.name)
    }
    
    func testFilterVisitorByWeek() {
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = "Prestador de Serviço"
        
        let visitor2 = Visitor()
        visitor2.startDateAndHour =  Calendar.current.date(byAdding: .day, value: -6, to: Date())
        visitor2.name = "Gabriel"
        visitor2.endDateAndHour = nil
        visitor2.phone = "51984619504"
        visitor2.responsibleAccess = "Gustavo"
        visitor2.category = "Particular"
        
        let visitor3 = Visitor()
        visitor3.startDateAndHour = Calendar.current.date(byAdding: .day, value: -20, to: Date())
        visitor3.name = "Mario"
        visitor3.endDateAndHour = nil
        visitor3.phone = "51984619504"
        visitor3.responsibleAccess = "Maria"
        visitor3.category = "Particular"
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: false, visitor: visitor)
        visitorBusiness.save(isAddInContacts: false, visitor: visitor2)
        visitorBusiness.save(isAddInContacts: false, visitor: visitor3)
        
        
        //Then
        let visitors = visitorBusiness.filterVisitors(startDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, endDate: Date())
        XCTAssertEqual(visitors.count, 2)
        XCTAssertEqual(visitor.name, "Márcio H. Brufatto")
        XCTAssertEqual(visitor2.name, "Gabriel")
    }
    
    func testFilterVisitorByMonth() {
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = "Prestador de Serviço"
        
        let visitor2 = Visitor()
        visitor2.startDateAndHour =  Calendar.current.date(byAdding: .day, value: -40, to: Date())
        visitor2.name = "Gabriel"
        visitor2.endDateAndHour = nil
        visitor2.phone = "51984619504"
        visitor2.responsibleAccess = "Gustavo"
        visitor2.category = "Particular"
        
        let visitor3 = Visitor()
        visitor3.startDateAndHour = Calendar.current.date(byAdding: .day, value: -35, to: Date())
        visitor3.name = "Mario"
        visitor3.endDateAndHour = nil
        visitor3.phone = "51984619504"
        visitor3.responsibleAccess = "Maria"
        visitor3.category = "Particular"
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: false, visitor: visitor)
        visitorBusiness.save(isAddInContacts: false, visitor: visitor2)
        visitorBusiness.save(isAddInContacts: false, visitor: visitor3)
        
        
        //Then
        let visitors = visitorBusiness.filterVisitors(startDate: Calendar.current.date(byAdding: .day, value: -30, to: Date())!, endDate: Date())
        XCTAssertEqual(visitors.count, 1)
        XCTAssertEqual(visitor.name, "Márcio H. Brufatto")
    }
    
    func testFilterVisitorByYear() {
        let visitor = Visitor()
        visitor.startDateAndHour = Date()
        visitor.name = "Márcio H. Brufatto"
        visitor.endDateAndHour = nil
        visitor.phone = "51984619504"
        visitor.responsibleAccess = "Síndico"
        visitor.category = "Prestador de Serviço"
        
        let visitor2 = Visitor()
        visitor2.startDateAndHour =  Calendar.current.date(byAdding: .day, value: -40, to: Date())
        visitor2.name = "Gabriel"
        visitor2.endDateAndHour = nil
        visitor2.phone = "51984619504"
        visitor2.responsibleAccess = "Gustavo"
        visitor2.category = "Particular"
        
        let visitor3 = Visitor()
        visitor3.startDateAndHour = Calendar.current.date(byAdding: .day, value: -400, to: Date())
        visitor3.name = "Mario"
        visitor3.endDateAndHour = nil
        visitor3.phone = "51984619504"
        visitor3.responsibleAccess = "Maria"
        visitor3.category = "Particular"
        
        //When
        let visitorBusiness = VisitorBusiness()
        visitorBusiness.save(isAddInContacts: false, visitor: visitor)
        visitorBusiness.save(isAddInContacts: false, visitor: visitor2)
        visitorBusiness.save(isAddInContacts: false, visitor: visitor3)
        
        
        //Then
        let visitors = visitorBusiness.filterVisitors(startDate: Calendar.current.date(byAdding: .day, value: -365, to: Date())!, endDate: Date())
        XCTAssertEqual(visitors.count, 2)
        XCTAssertEqual(visitor.name, "Márcio H. Brufatto")
        XCTAssertEqual(visitor2.name, "Gabriel")
    }
    
    
}
