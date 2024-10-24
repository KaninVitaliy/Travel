//
//  SecondViewCell.swift
//  Travel
//
//  Created by Виталий Канин on 15.10.2024.
//

import UIKit

class SecondViewCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleView: UILabel = {
        var titleView = UILabel()
        titleView.font = UIFont.notoSans(fontType: .regular, size: 24)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.lineBreakMode = .byCharWrapping
        titleView.textColor = UIColor(named: "DescriptionTextColor")
        return titleView
    }()
    
    var descriptionView: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .notoSans(fontType: .light, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondViewCell {
    
    private func commonInit() {
        setupLayout()
        setupConstraint()
    }
    
    private func setupLayout() {
        self.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(titleView)
        contentView.addSubview(descriptionView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -195),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 138),
            titleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -87),
            
            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 0),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 138),
            
        ])
    }
    
}
