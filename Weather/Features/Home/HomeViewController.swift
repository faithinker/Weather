//
//  HomeViewController.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit

class HomeViewController: UIViewController {
    typealias ViewModel = HomeViewModel
    
    // MARK: - ViewModelProtocol
    var viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        bindingViewModel()
    }
    
    // MARK: - View
    func setupLayout() {
        view.backgroundColor = .white
    }
    
    // MARK: - Binding
    func bindingViewModel() {
        print("viewModel : \(viewModel)")
        let res = viewModel.transform(req: ViewModel.Input())
    }
    

}

