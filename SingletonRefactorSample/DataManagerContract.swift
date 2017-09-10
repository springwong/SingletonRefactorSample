//
//  DataManagerProtocol.swift
//  SingletonRefactorSample
//
//  Created by Spring Wong on 10/9/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import Foundation

protocol DataManagerContract {
    func requestCheckLogin(successHandler : (()->Void)?)
    func reset()
    func getIsLoggedIn() -> Bool
}
