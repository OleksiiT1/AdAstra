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

class LaunchPresenterImplementation: CellDataSource, LaunchPresenter {

    
    private var model: Codable?
    private weak var view: LaunchView!
    private var router: LaunchRouter
    private var interactor: LaunchInteractor
    private var isLoading: Bool = false
    private var id: Int
    private var keys: [String] = ["id", "name"]
    
    init(id: Int, interactor: LaunchInteractor, router: LaunchRouter) {
        self.id = id
        self.interactor = interactor
        self.router = router
        interactor.presenter = self
    }

    func viewIsLoaded(_ view: LaunchView) {
        self.view = view
        load()
    }

    func loaded(launch: Launch) {
        isLoading = false
        model = launch
        view.update()
    }

    func load() {
        isLoading = true
        interactor.loadLaunch(id: id)
    }
    
    var count: Int {
        return model == nil ? 0 : keys.count
    }
    
    func at(_ index: Int) -> CellItem {
        if index < keys.count {
            return (model?[keys[index]] as? String) ?? "N/A"
        }
        return "N/A"
    }
    
    func prefetch(_ indexes: [Int]) {}
}

extension String: CellItem {
    var cellIdentifier: String {
        return R.nib.launchCellTableViewCell.identifier
    }
}

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    subscript(key: String) -> Any? {
        return asDictionary[key]
    }
    var asDictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
