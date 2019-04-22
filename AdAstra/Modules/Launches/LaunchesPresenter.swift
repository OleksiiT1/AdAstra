//
//  LaunchesPresenter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol LaunchesPresenter: class {
    func viewIsLoaded(_ view: LaunchesView)
    func loaded(launches: Launches)
    
    var count: Int { get }
    func at(_ index: Int) -> CellItem
}

protocol LaunchesView: class {
    func update()
}

protocol LaunchesInteractor: class {
    var presenter: LaunchesPresenter! { get set }
    func loadLaunches(offset: Int, limit: Int)
}


protocol CellItem {
    var cellIdentifier: String { get }    
}

class LaunchesPresenterImplementation: LaunchesPresenter {

    private weak var view: LaunchesView!
    private var interactor: LaunchesInteractor
    private var launches: [Launch] = []
    private var isLoading: Bool = false
    private var didReachedEnd: Bool = false
    private var offset: Int = 0
    private var limit: Int = 20

    init(interactor: LaunchesInteractor) {
        self.interactor = interactor
        interactor.presenter = self
    }

    func viewIsLoaded(_ view: LaunchesView) {
        self.view = view
        isLoading = true
        interactor.loadLaunches(offset: offset, limit: limit)
    }

    func loaded(launches: Launches) {
        offset = launches.offset + launches.count
        if offset >= launches.total {
            didReachedEnd = true
        }
        self.launches.append(contentsOf: launches.launches)
        isLoading = false
        view.update()
    }

    var count: Int {
        if launches.isEmpty {
            return 0
        }
        return launches.count + ( didReachedEnd ? 0 : 1 )
    }

    func at(_ index: Int) -> CellItem {
        if index < launches.count {
            return launches[index]
        }
        if !isLoading {
            interactor.loadLaunches(offset: offset, limit: limit)
        }
        return LoadingCellItem()
    }
}
