//
//  LoginViewController.swift
//  ensinamentos
//
//  Created by Gustavo Ramalho on 29/10/23.
//

import Foundation
import SwiftUI

protocol LoginViewControllerDisplay: AnyObject {
    func showAlert()
}

class LoginViewController: UIViewController, LoginViewControllerDisplay {
    func showAlert() {
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var interactor: LoginInteractor?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("iniciei")
        interactor?.callService()
    }
}
