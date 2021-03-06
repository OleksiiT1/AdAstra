//
//  RootRouter.swift
//  AdAstra
//
//  Copyright © ovt. All rights reserved.
//

import UIKit

class RootRouter {

    private lazy var  launchesRouter: LaunchesRouter = { return LaunchesRouter(delegate: self) }()
    private lazy var  missionsRouter: MissionsRouter = { return MissionsRouter(delegate: self) }()

    /** Replaces root view controller. You can specify the replacment animation type.
     If no animation type is specified, there is no animation */
    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions?) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(with: window, duration: 0.33, options: animationOptions, animations: {
            }, completion: nil)
        } else {
            window.rootViewController = controller
        }
    }

    func loadMainAppStructure() {
        // Customize your app structure here
        let controller = UITabBarController()
        controller.setViewControllers(
            [launchesRouter.rootController(),
             missionsRouter.rootController()],
            animated: true)

        setRootViewController(controller: controller, animatedWithOptions: nil)
    }
}
