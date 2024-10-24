//
//  AdventureViewCell.swift
//  Travel
//
//  Created by Виталий Канин on 17.10.2024.
//

import UIKit

class AdventureViewCell: UICollectionViewCell {
    
    // Объявление и настройка для изображения
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mountainLabel: UILabel = {
        var mountainLabel = UILabel()
        mountainLabel.font = UIFont.notoSans(fontType: .regular,size: 20)
        mountainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mountainLabel
    }()
    
    private lazy var countryLabel: UILabel = {
        var countryLabel = UILabel()
        countryLabel.text = "Nepal"
        countryLabel.font = UIFont.notoSans(fontType: .light,size: 18)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        return countryLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension AdventureViewCell {
    
    func commonInit() {
        setupLayout()
        setupConstraint()
    }
    
    func setupLayout() {
        self.clipsToBounds = true
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        addSubview(countryLabel)
        addSubview(imageView)
        addSubview(mountainLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            imageView.widthAnchor.constraint(equalToConstant: 135),
            imageView.heightAnchor.constraint(equalToConstant: 134),
            
            mountainLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            mountainLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            mountainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            mountainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -67),
            
            countryLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -11),
            countryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

        ])
    }
    
}

extension AdventureViewCell {
    func configureCell(stringUrl: String?, mountName: String, country: String) {
        if let stringUrl, let url = URL(string: stringUrl) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: imageData)
                }
            }.resume()
        }
        
        mountainLabel.text = mountName
        countryLabel.text = country
    }
}
