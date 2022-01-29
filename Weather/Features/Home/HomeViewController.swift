//
//  HomeViewController.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit
import RxSwift
import RxCocoa


class HomeViewController: UIViewController {
    typealias ViewModel = HomeViewModel
    
    // MARK: - ViewModelProtocol
    var viewModel = ViewModel()
    
    var relay = PublishRelay<HomeActionType>()
    
    let action = PublishRelay<HomeActionType>()
    
    let disposeBag = DisposeBag()
    
    /// 20
    let cCons: CGFloat = 20
    
    private var selectedIndex: IndexPath = IndexPath(row: 0, section: 0) {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        relay.accept(.selectSort(0))
        setupLayout()
        bindingViewModel()
        bindRx()
    }
    
    // MARK: - View
    lazy var naviBar = NaviBar(.setting).then {
        $0.titleLabel.text = "홈"
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        let dynamicWidth = (UIScreen.main.bounds.size.width - cCons*2) / 3
        $0.itemSize = CGSize(width: dynamicWidth, height: 35)
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    }).then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(246, 247, 248)
        $0.isScrollEnabled = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(SortCell.self, forCellWithReuseIdentifier: SortCell.identifier)
    }
    
    lazy var tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 65 + 10 //Cell과 간격
        $0.separatorStyle = .none
        $0.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.identifier)
    }
    
    
    // MARK: - Method
    func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubviews([naviBar, collectionView, tableView])
        
        naviBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        naviBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        naviBar.topAnchor.constraint(equalTo: view.topAnchor, constant: UIView.topSafeArea).isActive = true
        naviBar.heightAnchor.constraint(equalToConstant: naviBar.naviBarHeight).isActive = true
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: cCons).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -cCons).isActive = true
        collectionView.topAnchor.constraint(equalTo: naviBar.bottomAnchor,constant: 150).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: cCons).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -cCons).isActive = true
        tableView.topAnchor.constraint(equalTo: collectionView.topAnchor,constant: 50).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
    }
    
    // User Action
    @discardableResult
    func setupDI(relay: PublishRelay<HomeActionType>) -> Self {
        action.bind(to: relay).disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .do(onNext: { [weak self] in self?.selectedIndex = $0 })
            .map { .selectSort($0.row) }
            .bind(to: action)
            .disposed(by: disposeBag)
        
        return self
    }
    
    // MARK: - Binding
    func bindingViewModel() {
        let res = viewModel.transform(req: ViewModel.Input(eventTrigger: relay.asObservable()))
        
        self.setupDI(observable: res.sortList)
    }
    
    // Set Data
    @discardableResult
    func setupDI<T>(observable: Observable<[T]>) -> Self {
        if T.self == String.self {
            observable
                .bind(to: collectionView.rx.items(cellIdentifier: SortCell.identifier, cellType: SortCell.self)) { [weak self] row, element, cell in
                    guard let `self` = self, let element = element as? String else { return }
                    cell.title.text = element
                    cell.isSelected = row == self.selectedIndex.row
                    if row == 2 { cell.divider.isHidden = true }
                    
                }.disposed(by: disposeBag)
        }
        return self
    }
    
    func bindRx() {
        let list = ["서울", "수원"]
        Observable.just(list).bind(to: tableView.rx.items(cellIdentifier: WeatherCell.identifier, cellType: WeatherCell.self)) { [weak self] row, element, cell in
            guard let `self` = self else { return }
            
            cell.location.text = element
            
            
        }
    }

}

