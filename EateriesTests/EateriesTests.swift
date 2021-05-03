//
//  EateriesTests.swift
//  EateriesTests
//
//  Created by Weiye Zhou on 29/4/21.
//

import XCTest
@testable import Eateries
import SwiftUI

class EateriesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEateries() throws {
    //Use XCTAssertEqual to test whether the value of Food is equal to the assigned value.
        let EateriesImage = OTTOImage
        let EateriesName = "OTTO"
        let EateriesLocation = OTTOLocation
        let EateriesNote = OTTONote
        let EateriesReview = OTTOReview
        let eateries = Eatery(EateriesImage: OTTOImage, EateriesName: "OTTO", EateriesLocation: OTTOLocation, EateriesNote: OTTONote, EateriesReview: OTTOReview)
        XCTAssertEqual(eateries.EateriesImage, EateriesImage)
        XCTAssert(eateries.EateriesName == EateriesName)
        XCTAssertEqual(eateries.EateriesName, EateriesName)
        XCTAssertEqual(eateries.EateriesLocation, EateriesLocation)
        XCTAssertEqual(eateries.EateriesNote, EateriesNote)
        XCTAssertEqual(eateries.EateriesReview, EateriesReview)
    }
    
    func testAddElement(){
    //test add element function
        var model = [Eatery]()
        let eateries = Eatery(EateriesImage: "", EateriesName: "<New>", EateriesLocation: "Enter Location", EateriesNote: "Enter Note", EateriesReview: "Enter Review")
        model.append(eateries)
        model.append( Eatery(EateriesImage: HIDEImage, EateriesName: "HIDE", EateriesLocation: HIDELocation, EateriesNote: HIDENote, EateriesReview: HIDEReview))
        model.append(Eatery(EateriesImage: grillImage, EateriesName: "Bus Grill", EateriesLocation: grillLocation, EateriesNote: grillNote, EateriesReview: grillReview))
        XCTAssert(model.count == 3)
    }
    
    func testRemoveElement() {
    // test remove element function
        var eateries : [Eatery] = [Eatery(EateriesImage: OTTOImage, EateriesName: "OTTO", EateriesLocation: OTTOLocation, EateriesNote: OTTONote, EateriesReview: OTTOReview)]
        eateries.append( Eatery(EateriesImage: WONGImage, EateriesName: "MR.WONG", EateriesLocation: WONGLocation, EateriesNote: WONGNote, EateriesReview: WONGReview))
        eateries.remove(at: 0)
        XCTAssert(eateries.count == 1)
    }
    
    func testEateriesViewModel_valid(){
    // test FoodviewModel with valid URL
    let eateriesviewmodel = EateriesViewModel()
    let url = "https://ottoristorante.com.au/brisbane/wp-content/uploads/sites/3/2021/02/otto-b-web-6.jpg"
    let EateriesImage = eateriesviewmodel.download(url)
    XCTAssertNotNil(EateriesImage)
    }
    
    
    func testEateriesViewModel_invalid() {
    //test FoodViewModel with invalid URL
        let eateriesviewmodel = EateriesViewModel()
        let url = ""
        let EateriesImage = eateriesviewmodel.download(url)
        XCTAssertEqual(EateriesImage, Image("nonexistent"))
        }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
