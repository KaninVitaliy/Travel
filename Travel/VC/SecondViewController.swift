//
//  SecondViewController.swift
//  Travel
//
//  Created by Виталий Канин on 15.10.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var arrayView: [SecondView] = []
    
    public func initView() -> [SecondView] {
        let ticketView: SecondView = .init(frame: .zero, imageView: "Tickets", titleView: TitleView.ticket, descriptionView: DescriptionView.ticket, colorView: .ticket)
        
        let hotelView: SecondView = .init(frame: .zero, imageView: "Hotels", titleView: TitleView.hotels, descriptionView: DescriptionView.hotels, colorView: .hotels)
        
        let adventureView: SecondView = .init(frame: .zero, imageView: "Adventure", titleView: TitleView.adventure, descriptionView: DescriptionView.adventure, colorView: .adventure)
        
        let arrayView: [SecondView] = [ticketView, hotelView, adventureView]
        return arrayView
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = createFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SecondViewCell.self, forCellWithReuseIdentifier: "\(SecondViewCell.self)")
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    private var userIcon: UIImageView = {
        var userIcon = UIImageView()
        userIcon.image = UIImage(named: "AvatarImage")
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.contentMode = .scaleAspectFit
        return userIcon
    }()
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 320, height: 140)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 20, bottom: 30, right: 27)
        return layout
    }
    
    var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "SecondViewImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.arrayView = initView()
        setupConstraint()
    }
    
    private func setupView() {
        view.addSubview(imageView)
        view.addSubview(collectionView)
        view.addSubview(userIcon)
        view.backgroundColor = .black
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -112),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            
            userIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 42),
            userIcon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -750),
            userIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 289),
            userIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

        ])
        
        userIcon.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        userIcon.addGestureRecognizer(tap)
    }
    
    @objc
    private func handleTap() {
        let ViewController = ViewController()
        let secondNavCon = UINavigationController(rootViewController: ViewController)
        secondNavCon.navigationBar.prefersLargeTitles = true
        secondNavCon.modalPresentationStyle = .fullScreen
        present(secondNavCon, animated: true)
    }
    
    // Реализуем переход на третий экран
    private func showOwerviewController() {
        let thirdViewController = ThirdViewController()
        let thirdNavCon = UINavigationController(rootViewController: thirdViewController)
        thirdNavCon.navigationBar.prefersLargeTitles = true
        thirdNavCon.modalPresentationStyle = .fullScreen
        present(thirdNavCon, animated: true)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SecondViewCell.self)", for: indexPath) as? SecondViewCell
        else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = arrayView[indexPath.row].colorView
        cell.imageView.image = UIImage(named: arrayView[indexPath.row].imageView)
        cell.titleView.text = arrayView[indexPath.row].titleView.rawValue
        cell.descriptionView.text = arrayView[indexPath.row].descriptionView.rawValue
        cell.layer.cornerRadius = 20
        
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0: return
        case 1: return
        case 2:
            showOwerviewController()
        default:
            return
        }
        
    }
    
}
