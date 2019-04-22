//
//  LaunchesInteractorImplementation.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class LaunchesInteractorImplementation: LaunchesInteractor {
    
    
    func loadLaunches(offset: Int, limit: Int) {
        let queryBuilder = LaunchesURLBuilder()
        _ = queryBuilder.set(offset: offset).set(limit: limit)
        CommonDataService.get(link:queryBuilder.get()) { [weak self](launches: Launches?, error) in
            guard let launches = launches else {
                return
            }
            self?.presenter.loaded(launches: launches)
        }
    }

    weak var presenter: LaunchesPresenter!

}
