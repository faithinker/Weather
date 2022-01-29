//
//  SortCell.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit

class SortCell: UICollectionViewCell {
    static let identifier = String(describing: SortCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            title.textColor = isSelected ? UIColor(96, 57, 142) : UIColor(0, 0, 0)
            title.font = isSelected ? .systemFont(ofSize: 14, weight: .bold) : .systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    lazy var title = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var divider = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(196, 196, 196)
    }
    
    // MARK: SetupLayout
    private func setupLayout() {
        contentView.addSubviews([title, divider])
        
        title.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        divider.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        divider.trailingAnchor.constraint(equalTo: self.title.trailingAnchor).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
}


