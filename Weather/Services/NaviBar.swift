//
//  NaviBar.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit

enum NaviActionType {
    case setting
    case back
}

enum NaviShowType {
    case none
    case backCenterTitle
    case setting
}

class NaviBar: UIView {
    
    var type: NaviShowType = .none
    
    let navigationAction = PublishRelay<NaviActionType>()
    
    let disposeBag = DisposeBag()
    
    init(_ naviType: NaviShowType = .none) {
        super.init(frame: .zero)
        type = naviType
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    lazy var containerView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    lazy var backButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(Symbol.basic.back, for: .normal)
        $0.sizeToFit()
        $0.tintColor = .black
        $0.isHidden = true
        $0.rx.tap.map { NaviActionType.back }.bind(to: self.navigationAction).disposed(by: disposeBag)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textColor = .black
        $0.isHidden = true
    }
    
    lazy var settingButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.setImage(Symbol.basic.setting, for: .normal)
        $0.sizeToFit()
        $0.tintColor = .black
        $0.rx.tap.map { NaviActionType.setting }.bind(to: self.navigationAction).disposed(by: disposeBag)
    }
    
    lazy var naviBarHeight: CGFloat = 55
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: naviBarHeight).isActive = true
        
        containerView.addSubviews([backButton, settingButton, titleLabel])
        
        backButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        backButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 42).isActive = true

        
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        settingButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        settingButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        settingButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        settingButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        
        switch type {
        case .backCenterTitle:
            [backButton, titleLabel].forEach { $0.isHidden = false }
        case .setting:
            settingButton.isHidden = false
        case .none:
            break
        }
    }
}

        
