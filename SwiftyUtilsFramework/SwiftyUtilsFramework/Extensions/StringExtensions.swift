//
//  StringExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

public extension String {
    
    func showToast() {
        UIApplication.shared.keyWindow?.makeToast(self)
    }
    
    var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        
        let firstMatch = dataDetector?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: self.count))
        
        return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
    }
    
    func substring(to index: Int) -> String {
//        guard self.endIndex.encodedOffset >= index else { return self }
        
        let endIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[..<endIndex])
    }
    
    func substring(from index: Int) -> String {
//        guard index <= self.endIndex.encodedOffset else { return "" }
        
        let startIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[startIndex...])
    }
    
    var stripped: String {
        let okayChars = Set("1234567890+")
        return self.filter {okayChars.contains($0) }
    }
    var strippedDigits: String {
        let okayChars = Set("1234567890")
        return self.filter {okayChars.contains($0) }
    }
}
