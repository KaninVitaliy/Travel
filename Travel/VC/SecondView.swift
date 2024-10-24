//
//  SecondView.swift
//  Travel
//
//  Created by Виталий Канин on 15.10.2024.
//

import UIKit

class SecondView: UIView {
    
    var imageView: String
    var titleView: TitleView
    var descriptionView: DescriptionView
    var colorView: UIColor
    
    init(frame: CGRect, imageView: String, titleView: TitleView, descriptionView: DescriptionView, colorView: UIColor) {
        self.imageView = imageView
        self.titleView = titleView
        self.descriptionView = descriptionView
        self.colorView = colorView
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum TitleView: String {
    case ticket = "Tickets"
    case hotels = "Hotels"
    case adventure = "Adventure"
}

enum DescriptionView: String {
    case ticket = "Make your booking \nwith Flexifly and \nenjoy"
    case hotels = "The Ideal Hotel at a \nGreat Price"
    case adventure = "Find & book tours, \nadventures, \nactivities,"
}
