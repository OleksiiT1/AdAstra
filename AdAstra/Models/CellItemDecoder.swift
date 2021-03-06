//
//  CellItemDecoder.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

enum CellItemDecoder {
    case int(String)
    case string(String)
    case date(String, String)
    case urls(String)
    case group(String, String)
    
    func getCellItem(from model: Codable) -> [CellItem] {
        switch self {
        case .int(let key):
            return [CellItem.oneLine(StringDecoder.get(key, from: model))]
        case .string(let key):
            return [CellItem.oneLine(StringDecoder.get(key, from: model))]
        case .date(let key, let format):
            if let date = DateDecoder.get(key, format: format, from: model) {
                return [CellItem.oneLine(date)]
            }
            return [CellItem.oneLine("N/A")]
        case .urls(let key):
            return URLsDecoder.get(key, from: model).map { CellItem.oneLine($0)}
        case .group(let key, let defaultName):
            return ArrayDecoder.get(key, from: model).isEmpty ? [] : [CellItem.oneLine(defaultName)]
        }
    }
}

struct StringDecoder {
    static func get(_ key: String, from object: Codable) -> String {
        let string: Any? = object.extract(key: key)
        if let result = string as? Int {
            return "\(result)"
        }
        return (string as? String) ?? "N/A"
    }
}

struct DateDecoder {
    static func get(_ key: String, format: String, from object: Codable) -> Date? {
        let string: String = StringDecoder.get(key, from: object)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
}

struct StringArrayDecoder {
    static func get(_ key: String, from object: Codable) -> [String] {
        guard let strings: [String] = object.extract(key: key) else {
            return []
        }
        return strings
    }
}

struct URLsDecoder {
    static func get(_ key: String, from object: Codable) -> [URL] {
        guard let strings: [String] = object.extract(key: key) else {
            return []
        }
        return strings.compactMap { URL(string: $0) }
    }
}

struct ArrayDecoder {
    static func get(_ key: String, from object: Codable) -> [Any] {
        guard let strings: [Any] = object.extract(key: key) else {
            return []
        }
        return strings
    }
}
