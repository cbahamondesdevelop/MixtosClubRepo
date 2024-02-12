//
//  DictionaryRepresentable.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 23-10-23.
//

import Foundation

public protocol DictionaryRepresentable {
    var dictionary: [String: Any]? { get }
    var stringDictionary: [String: String]? { get }
    var json: String? { get }
}

public extension DictionaryRepresentable where Self: Encodable {
    var dictionary: [String: Any]? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        guard let data = try? encoder.encode(self) else {
            return nil
        }
        guard let serializedData = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return nil
        }
        guard let dict = serializedData as? [String: Any] else {
            return nil
        }
        return dict
    }
    
    var dictionaryForSalesforce: [String: Any]? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        guard let data = try? encoder.encode(self) else {
            return nil
        }
        guard let serializedData = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return nil
        }
        guard let dict = serializedData as? [String: Any] else {
            return nil
        }
        return dict
    }
    
    var stringDictionary: [String: String]? {
        guard let dictionary = self.dictionary else {
            return nil
        }
        
        var stringDictionary = [String: String]()
        for (key, value) in dictionary {
            if value is DictionaryRepresentable {
                if let stringDictionaryValue = (value as? DictionaryRepresentable)?.stringDictionary {
                    stringDictionary.merge(stringDictionaryValue) { current, _ -> String in
                        current
                    }
                } else {
                    return nil
                }
            } else {
                stringDictionary[key] = "\(value)"
            }
        }
        return stringDictionary
    }
    
    var json: String? {
        guard let dict = self.dictionary else {
            return nil
        }
        do {
            let serializedData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            let stringValue = String(bytes: serializedData, encoding: String.Encoding.utf8)
            return stringValue
        } catch {
            return nil
        }
    }
}
