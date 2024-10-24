//
//  ViewController.swift
//  Travel
//
//  Created by Виталий Канин on 14.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupView()
        setupConstraint()
    }
    
    private var imageMain: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "ImageMain")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // Добавим кнопку для ввода логин/пароль
    private var signButton: UIButton = {
        var signButton = UIButton()
        signButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        signButton.backgroundColor = UIColor(named: "SignColor")
        signButton.setTitle("Sign In", for: .normal)
        signButton.setTitleColor(.white, for: .normal)
        signButton.titleLabel?.font = UIFont.notoSans(fontType: .regular, size: 18)
        signButton.layer.cornerRadius = 10
        signButton.clipsToBounds = false
        signButton.translatesAutoresizingMaskIntoConstraints = false
        return signButton
    }()
    
    private var createAccountButton: UIButton = {
        var createAccountButton = UIButton()
        createAccountButton.backgroundColor = UIColor(named: "Create an account Color")
        createAccountButton.setTitle("Create an account", for: .normal)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.titleLabel?.font = UIFont.notoSans(fontType: .regular, size: 18)
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.clipsToBounds = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        return createAccountButton
    }()
    
    private var createSkipButton: UIButton = {
        var createSkip = UIButton()
        createSkip.translatesAutoresizingMaskIntoConstraints = false
        createSkip.contentMode = .scaleAspectFit
        return createSkip
    }()
    
    private var createSkipButtonLabel: UIImageView = {
        var createSkip = UIImageView()
        createSkip.image = UIImage(named: "Skip")
        createSkip.contentMode = .scaleToFill
        createSkip.translatesAutoresizingMaskIntoConstraints = false
        
        return createSkip
    }()
    
    private func setupView() {
        for i in [imageMain, signButton, createAccountButton, createSkipButton, createSkipButtonLabel] {
            view.addSubview(i)
        }
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            imageMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageMain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imageMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            signButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 627),
            signButton.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -177),
            signButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            signButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            
            createAccountButton.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 27),
            createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            
            createSkipButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 27),
            createSkipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            createSkipButton.leadingAnchor.constraint(equalTo: createAccountButton.leadingAnchor, constant: 79),
            createSkipButton.trailingAnchor.constraint(equalTo: createAccountButton.trailingAnchor, constant: -80),
            
            createSkipButtonLabel.centerXAnchor.constraint(equalTo: createSkipButton.centerXAnchor),
            createSkipButtonLabel.widthAnchor.constraint(equalToConstant: 36),
            createSkipButtonLabel.heightAnchor.constraint(equalToConstant: 18),
            createSkipButtonLabel.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 27),
            
        ])
        
    }
    
    // Реализуем переход на третий экран
    @objc private func handleTap() {
        let menuVC = SecondViewController() 
        let navController = UINavigationController(rootViewController: menuVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }

}

