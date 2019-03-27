//
//  URLExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//
import UIKit
import AVKit
public extension Int32 {
    func formatTimeFromSeconds() -> String {
        let seconds: Int32 = self%60
        let minutes: Int32 = (self/60)%60
        //        let hours: Int32 = totalSeconds/3600
        return String(format: "%02d:%02d", minutes,seconds)
    }
}
public extension URL {
    func getDuration() -> String {
        let asset = AVAsset(url: self)
        let duration = asset.duration
        let durationTime = CMTimeGetSeconds(duration)
        return Int32(durationTime).formatTimeFromSeconds()
    }
}
