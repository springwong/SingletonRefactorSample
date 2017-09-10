//
//  DataManager.swift
//  SingletonRefactorSample
//
//  Created by Spring Wong on 10/9/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import Foundation

class DataManager {
    //singleton
    static let sharedInstance = DataManager()
    
    private var isLoggedIn = false
    
    //gen a random number, 1/2 probe to login success
    func requestCheckLogin(successHandler : (()->Void)?) {
        let randomNumber = arc4random_uniform(2)
        let randomBool = Bool(NSNumber(value: randomNumber))
        isLoggedIn = randomBool
        successHandler?()
    }
    
    func reset() {
        isLoggedIn = false
    }
    
    func getIsLoggedIn() -> Bool {
        return isLoggedIn
    }
}
