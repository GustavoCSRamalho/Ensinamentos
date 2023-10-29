//
//  LoginInteractor.swift
//  ensinamentos
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import Foundation

protocol LoginInteractoring: AnyObject {
    
    var list: [Any] { get }
    var listcount: Int { get }
    func callService()
}

class LoginInteractor: LoginInteractoring {
    
    typealias ListData = [Any]
    
    var list: ListData = []
    
    lazy var listcount: Int = {
        list.count
    }()
    
    func callService() {
        guard let submitLogin = service.submitLogin() else{return}
        if submitLogin {
//            list = result.data
            presenter.submit(value: .register)
        } else {
            presenter.showAlert()
        }
    }

    
    private let presenter: LoginPresentering
    private let service: LoginServicing
    
    init(presenter: LoginPresentering, service: LoginServicing){
        self.presenter = presenter
        self.service = service
    }
}
