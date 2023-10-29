//
//  LoginPresenter.swift
//  ensinamentos
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import Foundation

protocol LoginPresentering: AnyObject {
    func submit(value: Action)
    func showAlert()
    
}

class LoginPresenter: LoginPresentering {
    
    private let vc: LoginViewControllerDisplay
    private let coordenator: LoginCoordenatoring
    
    init(vc: LoginViewControllerDisplay, coordenator: LoginCoordenatoring){
        self.vc = vc
        self.coordenator = coordenator
    }
    
    func submit(value: Action) {
        coordenator.submit(value: value)
    }
    
    func showAlert(){
        vc.showAlert()
    }
}

