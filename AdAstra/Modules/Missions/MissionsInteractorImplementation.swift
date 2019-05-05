//
//  MissionInteractorImplementation.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class MissionInteractorImplementation: MissionInteractor {

    let queryBuilder = MissionURLBuilder()

    func loadMission(offset: Int, limit: Int) {
        _ = queryBuilder.set(offset: offset).set(limit: limit)
        CommonDataService.get(link: queryBuilder.get()) { [weak self](mission: Missions?, _) in
            guard let mission = mission else {
                return
            }
            self?.presenter.loaded(missions: mission)
        }
    }

    weak var presenter: MissionPresenter!

}
