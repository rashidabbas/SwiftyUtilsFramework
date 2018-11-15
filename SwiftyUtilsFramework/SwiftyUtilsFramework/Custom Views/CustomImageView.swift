//
//  CustomImageView.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//
import UIKit
import AVFoundation

let imageCache = NSCache<NSString, UIImage>()
class ThumbnailImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadThumbnailWithURL(urlString: String) {
        self.imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        
        self.image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        DispatchQueue.global(qos: .background).async {
            let asset = AVAsset(url: url)
            let assetImgGenerate = AVAssetImageGenerator(asset: asset)
            assetImgGenerate.appliesPreferredTrackTransform = true
            let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
            do {
                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                let thumbnail = UIImage(cgImage: img)
                DispatchQueue.main.async {
                    if self.imageUrlString == urlString {
                        self.image = thumbnail
                    }
                    imageCache.setObject(thumbnail, forKey: urlString as NSString)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
