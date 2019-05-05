//
//  LaunchURLBuilder.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class LaunchURLBuilder {

    private var id = 0

    func get() -> String {
        return "https://launchlibrary.net/1.4/launch/\(id)"
    }

    func set(id: Int) -> LaunchURLBuilder {
        self.id = id
        return self
    }
}
