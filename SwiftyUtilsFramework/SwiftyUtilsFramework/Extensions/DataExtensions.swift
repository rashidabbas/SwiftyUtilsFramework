//
//  DataExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

public extension Data {
    func toString() -> String
    {
        return String(data: self, encoding: .utf8)!
    }
    
    func printData() {
        print("API RESULT***=\(self.toString())")
    }
    
    func decode<T>(type: T.Type , result: (T) -> () , fail: (String) -> ()) where T: Decodable {
        do {
            result(try JSONDecoder().decode(type, from: self))
        } catch {
            fail("Exception occured into parsing data \(error.localizedDescription)")
            print("Exception occured into parsing data \(error.localizedDescription)")
        }
    }
}

