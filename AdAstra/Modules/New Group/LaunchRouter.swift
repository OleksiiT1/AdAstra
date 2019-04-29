//
//  LaunchRouter.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation
import UIKit

class LaunchRouter {

    private let launchID: Int

    init(id: Int) {
        self.launchID = id
    }

    func rootController() -> UIViewController {
        let controller = LaunchTableViewController()
        let interactor = LaunchInteractorImplementation()
        controller.presenter = LaunchPresenterImplementation(id: launchID, interactor: interactor, router: self)
        controller.dataSource = controller.presenter
        controller.title = "Launches"
        return controller
    }
}
