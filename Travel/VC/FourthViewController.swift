//
//  FourthViewController.swift
//  Travel
//
//  Created by Виталий Канин on 19.10.2024.
//

import UIKit

class FourthViewController: UIViewController {
    
    var mountsInfo: AdventureElement?
    
    var mountTitleText: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.sign
        setupBackButton()
        setupView()
    }
    
    func setupBackButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backButtonTapped), imageName: "leftArrow")
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupView() {
        
        // Функция для информации про Гору
        configureViewInfo(mountImage: self.mountsInfo?.mountain_img,
                          mountName: self.mountsInfo?.name,
                          mountCountry: self.mountsInfo?.location,
                          mountsAltitude: self.mountsInfo?.altitude,
                          mountInfo: self.mountsInfo?.description,
                          mountFlag: self.mountsInfo?.country_flag_img,
                          mountDescription: self.mountsInfo?.description)
        
        let fullTextTitle = "This is a \(self.mountsInfo?.name ?? "")"
        mountTitle.font = .notoSans(fontType: .light, size: 35)
        let attributedString = NSMutableAttributedString(string: fullTextTitle)
        
        let boldRange = (fullTextTitle as NSString).range(of: "\(self.mountsInfo?.name ?? "")")
        let boldFont = UIFont.notoSans(fontType: .bold, size: 35)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)
        mountTitle.attributedText = attributedString
        
        view.addSubview(mountTitle)
        view.addSubview(layoutView)
        view.addSubview(imageView)
        view.addSubview(mountTitleInsertView)
        view.addSubview(mountCountryView)
        view.addSubview(mountAltitude)
        view.addSubview(imageFlag)
        layoutView.addSubview(scrollView)
        scrollView.addSubview(mountDescriptionView)
        view.addSubview(menuView)
        
        setupConstraint()
    }
    
    internal init(mountsInfo: AdventureElement?) {
        self.mountTitleText = self.mountsInfo?.name ?? ""
        self.mountsInfo = mountsInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    private var menuView: UIImageView = {
        var menuView = UIImageView()
        menuView.image = UIImage(named: "menuFourView")
        menuView.translatesAutoresizingMaskIntoConstraints = false
        return menuView
    }()
    
    private var layoutView: UIView = {
        var layoutView = UIView()
        layoutView.backgroundColor = .white
        layoutView.layer.cornerRadius = 20
        layoutView.translatesAutoresizingMaskIntoConstraints = false
        return layoutView
    }()
    
    private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var mountTitle: UILabel = {
        var mountTitle = UILabel()
        mountTitle.lineBreakMode = .byWordWrapping
        mountTitle.numberOfLines = 2
        mountTitle.translatesAutoresizingMaskIntoConstraints = false
        return mountTitle
    }()
    
    private var mountAltitude: UILabel = {
        var mountAltitude = UILabel()
        mountAltitude.font = UIFont.notoSans(fontType: .bold, size: 12)
        mountAltitude.translatesAutoresizingMaskIntoConstraints = false
        return mountAltitude
    }()
    
    private var imageFlag: UIImageView = {
        var imageFlag = UIImageView()
        imageFlag.translatesAutoresizingMaskIntoConstraints = false
        imageFlag.contentMode = .scaleToFill
        imageFlag.layer.cornerRadius = 5
        imageFlag.clipsToBounds = true
        imageFlag.backgroundColor = .colorFlag
        return imageFlag
    }()
    
    private var mountTitleInsertView: UITextField = {
        var mountTitleInsertView = UITextField()
        mountTitleInsertView.translatesAutoresizingMaskIntoConstraints = false
        mountTitleInsertView.font = UIFont.notoSans(fontType: .regular, size: 20)
        return mountTitleInsertView
    }()
    

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var mountDescriptionView: UILabel = {
        var mountDescriptionView = UILabel()
        mountDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        mountDescriptionView.font = UIFont.notoSans(fontType: .light, size: 18)
        mountDescriptionView.numberOfLines = 0
        return mountDescriptionView
    }()
    
    private var mountCountryView: UITextField = {
        var mountCountry = UITextField()
        mountCountry.translatesAutoresizingMaskIntoConstraints = false
        mountCountry.font = UIFont.notoSans(fontType: .light, size: 18)
        return mountCountry
    }()
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            mountTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mountTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
                      
            layoutView.topAnchor.constraint(equalTo: mountTitle.bottomAnchor, constant: 10),
            layoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            layoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            layoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            imageView.topAnchor.constraint(equalTo: layoutView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: layoutView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 315),
            
            mountTitleInsertView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            mountTitleInsertView.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor, constant: 25),
            
            mountCountryView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 35),
            mountCountryView.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor, constant: 25),
            
            mountAltitude.topAnchor.constraint(equalTo: mountCountryView.bottomAnchor, constant: 5),
            mountAltitude.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor, constant: 25),
            
            imageFlag.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            imageFlag.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor, constant: 241),
            imageFlag.trailingAnchor.constraint(equalTo: layoutView.trailingAnchor, constant: -37),
            imageFlag.heightAnchor.constraint(equalToConstant: 68),
            
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 88),
            scrollView.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: layoutView.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: layoutView.bottomAnchor, constant: 0),
            
            mountDescriptionView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            mountDescriptionView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            mountDescriptionView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            mountDescriptionView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            mountDescriptionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            menuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -782),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 337),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FourthViewController {
    
    func configureViewInfo(mountImage: String?, mountName: String?, mountCountry: String?, mountsAltitude: String?, mountInfo: String?, mountFlag: String?, mountDescription: String?) {
        if let mountImage, let url = URL(string: mountImage) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: imageData)
                }
            }.resume()
        }
        
        if let mountFlag, let url = URL(string: mountFlag) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self?.imageFlag.image = UIImage(data: imageData)
                }
            }.resume()
        } else {
            self.imageFlag.image = UIImage(named: "Flag")
        }
        
        mountTitleInsertView.text = mountName ?? ""
        
        mountCountryView.text = mountCountry
        
        mountAltitude.text = mountsAltitude
        
        mountDescriptionView.text = mountDescription
        
    }
}

extension UIBarButtonItem {

    static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = .black

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 45).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 47).isActive = true

        return menuBarItem
    }
}
