//
//  Launch.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

struct Launch: Codable {
    var id: Int
    var name: String
    var net: String
//    var lsp: String
    
    var launchDate: Date? {
        return DateDecoder.get("net", format: "MMMM dd, yyyy HH:mm:ss zzz", from: self)
    }
}
