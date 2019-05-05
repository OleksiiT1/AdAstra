//
//  LaunchInteractor.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class LaunchInteractorImplementation: LaunchInteractor {
    weak var presenter: LaunchPresenter!
    let queryBuilder = LaunchURLBuilder()

    func loadLaunch(id: Int) {
        _ = queryBuilder.set(id: id)
        CommonDataService.get(link: queryBuilder.get()) { [weak self](launches: Launches?, _) in
            guard let launches = launches else {
                return
            }
            guard let launch = launches.launches.first else {
                return
            }
             self?.presenter.loaded(launch: launch)
        }
    }
}
