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
    func loaded(launches: [Launch])
    
    var count: Int { get }
    func at(_ index: Int) -> Launch
}

protocol LaunchesView: class {
    func update()
}

protocol LaunchesInteractor: class {
    var presenter: LaunchesPresenter! { get set }
    func loadLaunches()
}

class LaunchesPresenterImplementation: LaunchesPresenter {

    private weak var view: LaunchesView!
    private var interactor: LaunchesInteractor
    private var launches: [Launch] = []
    
    init(interactor: LaunchesInteractor) {
        self.interactor = interactor
        interactor.presenter = self
    }

    func viewIsLoaded(_ view: LaunchesView) {
        self.view = view
        interactor.loadLaunches()
    }

    func loaded(launches: [Launch]) {
        self.launches.append(contentsOf: launches)
        view.update()
    }
    
    
    var count: Int {
        return launches.count
    }
    
    func at(_ index: Int) -> Launch {
        return launches[index]
    }
}
