//
//  LaunchesInteractorImplementation.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class LaunchesInteractorImplementation: LaunchesInteractor {
    func loadLaunches() {
        CommonDataService.get(link: "https://launchlibrary.net/1.4/launch") { [weak self](launches: Launches?, error) in
            guard let launches = launches?.launches else {
                return
            }
            self?.presenter.loaded(launches: launches)
        }
    }

    weak var presenter: LaunchesPresenter!

}
