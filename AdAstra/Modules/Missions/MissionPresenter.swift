//
//  MissionPresenter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol MissionPresenter: class, CellDataSource {
    func viewIsLoaded(_ view: MissionView)
    func loaded(missions: Missions)
}

protocol MissionView: class {
    func update()
}

protocol MissionInteractor: class {
    var presenter: MissionPresenter! { get set }
    func loadMission(offset: Int, limit: Int)
}

class MissionPresenterImplementation: InfiniteCellItemDataSource, MissionPresenter {

    private weak var view: MissionView!
    private var router: MissionsRouter
    private var interactor: MissionInteractor
    private var isLoading: Bool = false

    init(interactor: MissionInteractor, router: MissionsRouter) {
        self.interactor = interactor
        self.router = router
        super.init()
        interactor.presenter = self
    }

    func viewIsLoaded(_ view: MissionView) {
        self.view = view
        load(offset: 0, limit: 20)
    }

    func loaded(missions: Missions) {
        append(rawCellData: missions)
        isLoading = false
        view.update()
    }

    override func load(offset: Int, limit: Int) {
        if !isLoading {
            isLoading = true
            interactor.loadMission(offset: offset, limit: limit)
        }
    }

}
