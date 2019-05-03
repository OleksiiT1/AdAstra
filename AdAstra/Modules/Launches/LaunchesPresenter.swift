//
//  LaunchesPresenter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol LaunchesPresenter: class, CellDataSource {
    func viewIsLoaded(_ view: LaunchesView)
    func selected(index: Int)
    func loaded(launches: Launches)
}

protocol LaunchesView: class {
    func update()
}

protocol LaunchesInteractor: class {
    var presenter: LaunchesPresenter! { get set }
    func loadLaunches(offset: Int, limit: Int)
}

class LaunchesPresenterImplementation: InfiniteCellItemDataSource, LaunchesPresenter {

    private weak var view: LaunchesView!
    private var router: LaunchesRouter
    private var interactor: LaunchesInteractor
    private var isLoading: Bool = false

    init(interactor: LaunchesInteractor, router: LaunchesRouter) {
        self.interactor = interactor
        self.router = router
        super.init()
        interactor.presenter = self
    }

    func viewIsLoaded(_ view: LaunchesView) {
        self.view = view
        load(offset: 0, limit: 20)
    }

    func loaded(launches: Launches) {
        append(rawCellData: launches)
        isLoading = false
        view.update()
    }

    override func load(offset: Int, limit: Int) {
        if !isLoading {
            isLoading = true
            interactor.loadLaunches(offset: offset, limit: limit)
        }
    }

    func selected(index: Int) {
        guard let item = super.at(index) as? Launch else { return }
        router.show(launch: item.id)
    }
    
}
