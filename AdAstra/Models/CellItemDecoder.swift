//
//  CellItemDecoder.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

enum CellItemDecoder {
    case string(String)
    case date(String, String)
    case urls(String)

    func getCellItem(from model: Codable) -> CellItem? {
        switch self {
        case .string(let key):
            return StringDecoder.get(key, from: model)
        case .date(let key, let format):
            return DateDecoder.get(key, format: format, from: model)
        case .urls(let key):
            return URLsDecoder.get(key, from: model)
        }
    }
}

struct StringDecoder {
    static func get(_ key: String, from object: Codable) -> String? {
        guard let string: String = object.extract(key: key) else { return nil }
        return string
    }
}

struct DateDecoder {
    static func get(_ key: String, format: String, from object: Codable) -> Date? {
        guard let string: String = StringDecoder.get(key, from: object) else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
}

struct StringArrayDecoder {
    static func get(_ key: String, from object: Codable) -> [String] {
        guard let strings: [String] = object.extract(key: key) else { return [] }
        return strings
    }
}

struct URLsDecoder {
    static func get(_ key: String, from object: Codable) -> [URL] {
        guard let strings: [String] = object.extract(key: key) else { return [] }
        return strings.compactMap { URL(string: $0) }
    }
}
