//
//  LoginService.swift
//  ensinamentos
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import Foundation

protocol LoginServicing: AnyObject {
    func submitLogin() -> Bool?
}

class LoginService: LoginServicing {
    func submitLogin() -> Bool? {
        return false
    }
    
    
}
