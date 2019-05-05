//
//  Launches.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

struct Launches: Codable {
    var total: Int
    var offset: Int
    var count: Int
    var launches: [Launch]
}
