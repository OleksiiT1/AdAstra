//
//  LaunchPresenter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol LaunchPresenter: class, CellDataSource {
    func viewIsLoaded(_ view: LaunchView)
    func loaded(launch: Launch)
}

protocol LaunchView: class {
    func update()
}

protocol LaunchInteractor: class {
    var presenter: LaunchPresenter! { get set }
    func loadLaunch(id: Int)
}

class LaunchPresenterImplementation: DictionaryCellItemDataSource, LaunchPresenter {

    private weak var view: LaunchView!
    private var router: LaunchRouter
    private var interactor: LaunchInteractor
    private var isLoading: Bool = false
    private var id: Int
    override var keys: [CellItemDecoder] {
        return [.int("id"),
         .string("name"),
         .date("net", "MMMM dd, yyyy HH:mm:ss zzz"),
         .urls("infoURLs"),
         .group("vidURLs", "Videos")
        ]
    }

    init(id: Int, interactor: LaunchInteractor, router: LaunchRouter) {
        self.id = id
        self.interactor = interactor
        self.router = router
        super.init()
        interactor.presenter = self
    }

    func viewIsLoaded(_ view: LaunchView) {
        self.view = view
        load()
    }

    func loaded(launch: Launch) {
        isLoading = false
        set(model: launch)
        view.update()
    }

    func load() {
        isLoading = true
        interactor.loadLaunch(id: id)
    }
}
