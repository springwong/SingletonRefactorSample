//
//  MockDataManager.swift
//  SingletonRefactorSample
//
//  Created by Spring Wong on 10/9/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import Foundation

class MockDataManager : DataManagerContract {
    internal func getIsLoggedIn() -> Bool {
        return isLoggedIn
    }

    var isLoggedIn = false
    
    internal func reset() {
        isLoggedIn = false
    }

    internal func requestCheckLogin(successHandler: (() -> Void)?) {
        isLoggedIn = true
        successHandler?()
    }

    
}
