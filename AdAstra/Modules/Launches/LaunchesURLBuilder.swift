//
//  LaunchesURLBuilder.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation


class LaunchesURLBuilder {
    
    private var limit = 0
    private var offset = 0
    
    func get() -> String {
        return "https://launchlibrary.net/1.4/launch/next/\(limit)?offset=\(offset)"
    }
 
    func set(limit: Int) -> LaunchesURLBuilder {
        self.limit = limit
        return self
    }
    
    func set(offset: Int) -> LaunchesURLBuilder {
        self.offset = offset
        return self
    }
}
