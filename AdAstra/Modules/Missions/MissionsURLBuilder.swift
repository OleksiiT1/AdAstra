//
//  LaunchesURLBuilder.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation


class MissionURLBuilder {
    
    private var limit = 0
    private var offset = 0

    func get() -> String {
        return "https://launchlibrary.net/1.4/mission/next/\(limit)?offset=\(offset)"
    }

    func set(limit: Int) -> MissionURLBuilder {
        self.limit = limit
        return self
    }
    
    func set(offset: Int) -> MissionURLBuilder {
        self.offset = offset
        return self
    }
}
