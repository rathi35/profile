//
//  ProfileTests.swift
//  ProfileTests
//
//  Created by Rathi on 04/04/21.
//

import XCTest
import OHHTTPStubsSwift
import OHHTTPStubs
@testable import Profile

class ProfileTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testProfileAPI() throws {
        _ = APIService().getProfileInfo { (profileList, error) in
            XCTAssert(profileList!.count == 79)
            dump(profileList)
        }
    }
    
    
    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }
    func setStubForSearchRepo() {
        setStub("/get/ceiNKFwyaa?indent=2", jsonName: "response.json")
    }
    func setStub(_ urlPath: String, jsonName: String) {
        stub(condition: pathEndsWith(urlPath)) { _ in
            let stubPath = OHPathForFile(jsonName, type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
}
