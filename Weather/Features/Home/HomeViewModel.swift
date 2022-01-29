//
//  HomeViewModel.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit
import RxSwift
import RxCocoa

enum HomeActionType {
    case selectSort(Int)
}

class HomeViewModel: NSObject {
    // MARK: - ViewModelType Protocol
    typealias ViewModel = HomeViewModel
    
    let disposeBag = DisposeBag()
    
    deinit {
        print("로그 : \(self)!!")
    }
    
    struct Input {
        let eventTrigger: Observable<HomeActionType>
    }
    
    struct Output {
        let sortList: Observable<[String]>
    }
    
    func transform(req: ViewModel.Input) -> ViewModel.Output {
        req.eventTrigger.withUnretained(self)
            .map { $0.0.handleEvent($0.1) }
            .subscribe()
            .disposed(by: disposeBag)
        
        return Output(sortList: Observable.just(["이름", "현재기온", "거리"]))
    }
    
    
    fileprivate func handleEvent<T>(_ type: T) {
        guard let type = type as? HomeActionType else { return }
        switch type {
        case .selectSort(let index):
            break
            //getAppUsageTimeList(index: index)
        }
    }
}

