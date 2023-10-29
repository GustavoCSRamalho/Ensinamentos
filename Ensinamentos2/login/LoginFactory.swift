//
//  LoginFactory.swift
//  ensinamentos
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import Foundation
class LoginFactory {
    
    func make() -> LoginViewController {
        
        let service = LoginService()
        
        let coordenator = LoginCoordenator()
        
        let vc = LoginViewController()
        
        let vcDisplay = vc as! LoginViewControllerDisplay
        
        let presenter = LoginPresenter(vc: vcDisplay, coordenator: coordenator)
        
        let interactor = LoginInteractor(presenter: presenter, service: service)
        
        vc.interactor = interactor
        coordenator.vc = vc

        
        return vc
    }
}
