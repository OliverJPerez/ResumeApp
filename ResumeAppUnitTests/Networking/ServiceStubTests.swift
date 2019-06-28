//
//  ServiceStubTests.swift
//  BindingsExampleTests
//
//  Created by Oliver Jordy Perez Escamilla on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

// MARK: - ServiceStubTests
class ServiceStubTests: XCTestCase {
    
    func testProfileInfoIsFetchedWithSuccess() {
        // given
        let session = URLSessionStub()
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "oliverProfile", ofType: "json") else {
            XCTFail("Invaild data path")
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Profile data downloads with success")
        session.testData = data
        
        // when
        ProfileInteractor().fetch(with: session, onSuccess: { profile in
            expectation.fulfill()
        }, onError: { error in
            XCTFail()
        })
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    func testProfileInfoFetchedWithInvalidDataError() {
        // given
        let session = URLSessionStub()
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "badProfile", ofType: "json") else {
            XCTFail("Invaild data path")
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Profile data downloads with success")
        session.testData = data
        
        // when
        ProfileInteractor().fetch(with: session, onSuccess: { _ in
            XCTFail()
        }, onError: { error in
            if (error == ServiceError.invalidData) {
                expectation.fulfill()
            }
            else {
                XCTFail()
            }
        })
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    func testProfileInfoFetchedWithNoDataError() {
        // given
        let session = URLSessionStub()
        let expectation = XCTestExpectation(description: "Profile data downloads with success")
        session.testData = nil
        
        // when
        ProfileInteractor().fetch(with: session, onSuccess: { _ in
            XCTFail()
        }, onError: { error in
            if (error == ServiceError.noData) {
                expectation.fulfill()
            }
            else {
                XCTFail()
            }
        })
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    // MARK: - Mock classes
    class DataTaskDummy: URLSessionDataTask {
        override func resume() {
        }
    }
    
    class URLSessionStub: URLSessionProtocol {
        var testData: Data?
        func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            defer {
                completionHandler(testData, nil, nil)
            }
            
            return DataTaskDummy()
        }
    }
}

