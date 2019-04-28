//
//  Missions.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation


struct Missions: Codable {
    var total: Int
    var offset: Int
    var count: Int
    var missions: [Mission]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decode(Int.self, forKey: .total)
        count = try values.decode(Int.self, forKey: .count)
        let offset = try? values.decode(Int.self, forKey: .offset)
        if offset == nil {
            self.offset = 0
        } else {
            self.offset = offset ?? 0
        }
        missions = try values.decode([Mission].self, forKey: .missions)
    }
}


extension Missions: RawCellData {
    var content: [CellItem] {
        return missions
    }
}
