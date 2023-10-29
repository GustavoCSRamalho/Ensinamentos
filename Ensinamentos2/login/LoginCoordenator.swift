//
//  LoginCoordenator.swift
//  ensinamentos
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import Foundation

enum Action {
    case register
}

protocol LoginCoordenatoring: AnyObject{
    func submit(value: Action)
}

class LoginCoordenator: LoginCoordenatoring {
    
    var vc: LoginViewController?
    
    func submit(value: Action){
        switch value{
        case .register:
            print("troquei de tela")
            
//            vc?.present(LoginFactory().make(), animated: true)
        }
    }
}
