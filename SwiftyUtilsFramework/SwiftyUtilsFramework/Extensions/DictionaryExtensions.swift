//
//  DictionaryExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

public extension Dictionary {
    func stringFromHttpParameters() -> String {
        var parametersString = ""
        for (key, value) in self {
            if let key = key as? String,
                let value = value as? String {
                parametersString = parametersString + key + "=" + value + "&"
            }
        }
        let lastIndex = parametersString.index(parametersString.endIndex, offsetBy: -1)
        parametersString = String(parametersString.prefix(upTo: lastIndex))
        return parametersString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    func queryItems() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        for (key , value) in self {
            if let key = key as? String,let value = value as? String {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
        }
        return queryItems
    }
    
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func toJsonString() -> String {
        return json
    }
}

