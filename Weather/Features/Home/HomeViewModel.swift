//
//  HomeViewModel.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit

class HomeViewModel: NSObject {
    // MARK: - ViewModelType Protocol
    typealias ViewModel = HomeViewModel
    
    
    
    deinit {
        print("로그 : \(self)!!")
    }
    
    struct Input {
    }
    
    struct Output {
    }
    
    func transform(req: ViewModel.Input) -> ViewModel.Output {
        return Output()
    }
}

