//
//  LoginInteractor.swift
//  Ensinamentos2Tests
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import XCTest
@testable import Ensinamentos2

final class LoginServiceSpy: LoginServicing {
    var callSubmitLogin = 0
    var serviceResult = true
    
    func submitLogin() -> Bool? {
        callSubmitLogin += 1
        return serviceResult
    }
}

final class LoginViewControllerSpy: LoginViewControllerDisplay {
    
    var callShowAlert = 0
    
    func showAlert() {
        callShowAlert += 1
    }
}

final class LoginCoordenatorSpy: LoginCoordenatoring {
    
    var value: Ensinamentos2.Action?
    var callSubmit = 0
    
    var vc: LoginViewControllerDisplay?

    func submit(value: Ensinamentos2.Action) {
        callSubmit += 1
        self.value = value
    }
}

final class LoginPresenterSpy: LoginPresentering {
    
    var callSubmit = 0
    var callShowAlert = 0
    var value: Ensinamentos2.Action?
    
    private var vc: LoginViewControllerDisplay?
    private var coordenator: LoginCoordenatoring?
    
    init(vc: LoginViewControllerDisplay, coordenator: LoginCoordenatoring) {
        self.vc = vc
        self.coordenator = coordenator
        
    }
    
    func submit(value: Ensinamentos2.Action) {
        callSubmit += 1
        self.value = value
    }
    
    func showAlert() {
        callShowAlert += 1
    }
}

final class LoginInteractorTest: XCTestCase {
    
    func makeSetup() -> (LoginInteractor, LoginPresenterSpy, LoginViewControllerSpy, LoginCoordenatorSpy, LoginServiceSpy) {
        let service = LoginServiceSpy()
        
        let coordenator = LoginCoordenatorSpy()
        
        let vc = LoginViewController()
        
        let vcDisplay = LoginViewControllerSpy()
        
        
        let presenter = LoginPresenterSpy(vc: vcDisplay, coordenator: coordenator)
        
        let interactor = LoginInteractor(presenter: presenter, service: service)
        
        vc.interactor = interactor
        coordenator.vc = vc
        
        return (interactor, presenter, vcDisplay, coordenator, service)
    }
    
    func testCallService() {
        var (interactor, presenter, vcDisplay, coordenator, service) = makeSetup()
        
        interactor.callService()
        
        XCTAssertEqual(presenter.callShowAlert, 0)
        XCTAssertEqual(presenter.callSubmit, 1)

    }
    
    func testCallServiceFalse() {
        var (interactor, presenter, vcDisplay, coordenator, service) = makeSetup()
        
        service.serviceResult = false
        
        interactor.callService()
        
        XCTAssertEqual(presenter.callShowAlert, 1)
        XCTAssertEqual(presenter.callSubmit, 0)
    }

}
