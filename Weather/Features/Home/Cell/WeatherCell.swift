//
//  WeatherCell.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let identifier = String(describing: WeatherCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    lazy var weatherIcon = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "cloud")
        $0.sizeToFit()
    }
    
    lazy var location = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    lazy var temp = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }
    
    lazy var humidity = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    lazy var seperator = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    // MARK: - Method
    func setupLayout() {
        contentView.addSubviews([weatherIcon, location, temp, humidity, seperator])
        let cCons: CGFloat = 15
        
        weatherIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cCons).isActive = true
        weatherIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        location.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 30).isActive = true
        location.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        temp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cCons).isActive = true
        temp.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        humidity.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cCons).isActive = true
        humidity.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        seperator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cCons).isActive = true
        seperator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cCons).isActive = true
        seperator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive = true
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func configure() {
        
    }
}
