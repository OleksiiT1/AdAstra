//
//  LaunchesRouter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation
import UIKit

class LaunchesRouter {

    private weak var delegate: LaunchesRouterDelegate?
    
    init(delegate: LaunchesRouterDelegate) {
        self.delegate = delegate
    }

    func rootController() -> UIViewController {
        let controller = LaunchesTableViewController()
        let interactor = LaunchesInteractorImplementation()
        controller.presenter = LaunchesPresenterImplementation(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: "Launches", image: nil, tag: 0)
        controller.title = "Launches"
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }    
}
