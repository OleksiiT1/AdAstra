//
//  LaunchesRouter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation
import UIKit

class MissionsRouter {

    private weak var delegate: MissionsRouterDelegate?
    
    init(delegate: MissionsRouterDelegate) {
        self.delegate = delegate
    }

    func rootController() -> UIViewController {
        let controller = MissionTableViewController()
        let interactor = MissionInteractorImplementation()
        controller.presenter = MissionPresenterImplementation(interactor: interactor, router: self)
        controller.dataSource = controller.presenter
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: "Missions", image: nil, tag: 0)
        controller.title = "Missions"
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
