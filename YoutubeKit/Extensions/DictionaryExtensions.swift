//
//  DictionaryExtensions.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    mutating func appendingQueryParameter(key: String, value: Date?) {
        if let value = value {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            dateFormatter.timeZone = TimeZone.current
            self[key] = dateFormatter.string(from: value)
        }
    }
    
    mutating func appendingQueryParameter(key: String, value: Any?) {
        if let value = value {
            self[key] = value
        }
    }
    
    mutating func appendingQueryParameter<T: RawRepresentable>(key: String, value: T?) where T.RawValue == String {
        if let value = value {
            self[key] = value.rawValue
        }
    }
    
    mutating func appendingQueryParameter<T: RawRepresentable>(key: String, value: [T]?) where T.RawValue == String {
        if let value = value {
            self[key] = value.map { $0.rawValue }.joined(separator: ",")
        }
    }
}
