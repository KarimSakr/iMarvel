//
//  LoginViewController.swift
//  iMarvel
//
//  Created by Karim Sakr on 08/04/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift

protocol LoginDisplayLogic: AnyObject {
    
    
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
    var router: LoginRouter?
    
    private let bag = DisposeBag()
    
    
    private lazy var usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder  = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .accent
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        header.backgroundColor = .accent
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: .marvelLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
}

//MARK: - LifeCycle
extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupButtons()
        addMainSubviews()
                
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            
            // Header View constraints
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            
            imageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                
            
            // Username/Email Field constraints
            usernameEmailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            usernameEmailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            usernameEmailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            usernameEmailField.heightAnchor.constraint(equalToConstant: 52),
            
            // Password Field constraints
            passwordField.topAnchor.constraint(equalTo: usernameEmailField.bottomAnchor, constant: 15),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordField.heightAnchor.constraint(equalToConstant: 52),
            
            // Login Button constraints
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            
            // Activity Indicator constraints
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
}

//MARK: - setup
extension LoginViewController {
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setupButtons() {
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
    }
    
}

//MARK: - functions
extension LoginViewController {
    
    @objc private func didTapLoginButton() {

        
    }
    func addMainSubviews() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(self.headerView)
        view.addSubview(self.imageView)
        view.addSubview(self.usernameEmailField)
        view.addSubview(self.passwordField)
        view.addSubview(self.loginButton)
        view.addSubview(self.activityIndicator)
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
    }
    
    func startLoading() {
        usernameEmailField.isHidden  = true
        passwordField.isHidden       = true
        loginButton.isHidden         = true
        activityIndicator.isHidden   = false
        
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        
        usernameEmailField.isHidden  = false
        passwordField.isHidden       = false
        loginButton.isHidden         = false
        activityIndicator.isHidden   = true
        activityIndicator.stopAnimating()
    }

    func showSnackbar(with message: String) {
        DispatchQueue.main.async {
            AppSnackBar.make(in: self.view!, message: message, duration: .lengthLong).show()
        }
    }
}


//MARK: - UITextField
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField{
            didTapLoginButton()
        }
        return true
    }
}

