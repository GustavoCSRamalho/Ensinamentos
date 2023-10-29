//
//  LoginInteractor.swift
//  Ensinamentos2Tests
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import XCTest
@testable import Ensinamentos2

final class LoginPresenterTest: XCTestCase {
    
    func makeSetup() -> (LoginPresenter, LoginViewControllerSpy, LoginCoordenatorSpy, LoginServiceSpy) {
        let service = LoginServiceSpy()
        
        let coordenator = LoginCoordenatorSpy()
        
        let vc = LoginViewController()
        
        let vcDisplay = LoginViewControllerSpy()
        
        
        let presenter = LoginPresenter(vc: vcDisplay, coordenator: coordenator)
        
        let interactor = LoginInteractor(presenter: presenter, service: service)
        
        vc.interactor = interactor
        coordenator.vc = vc
        
        return (presenter, vcDisplay, coordenator, service)
    }
    
    func testSubmit() {
        var (presenter, vcDisplay, coordenator, service) = makeSetup()
        
        presenter.submit(value: .register)
        
        XCTAssertEqual(coordenator.value, .register)
        XCTAssertEqual(coordenator.callSubmit, 1)
    }
    
    func testShowAlert() {
        var (presenter, vcDisplay, coordenator, service) = makeSetup()

        presenter.showAlert()
        
        XCTAssertEqual(coordenator.value, .none)
        XCTAssertEqual(vcDisplay.callShowAlert, 1)
    }

}
