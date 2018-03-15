//
//  UIImageExtensions.swift
//  siemensctitp
//
//  Created by Paul Kraft on 27.05.17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

import UIKit
import Accelerate

extension UIImage {
    public static let serialQueue = DispatchQueue(label: "\(UIImage.self)")
}

extension UIImage {
    
    // source: https://gist.github.com/ericdke/fae887759c2fe9748efb
    public func blurred(radius: Int) -> UIImage {
        
        let boxSize = radius - (radius % 2) + 1
        let image = self.cgImage!
        let inProvider = image.dataProvider!
        
        let height = vImagePixelCount(image.height)
        let width = vImagePixelCount(image.width)
        let rowBytes = image.bytesPerRow
        
        let inBitmapData = inProvider.data
        let inData = UnsafeMutableRawPointer(mutating: CFDataGetBytePtr(inBitmapData))
        var inBuffer = vImage_Buffer(data: inData, height: height, width: width, rowBytes: rowBytes)
        
        let outData = malloc(image.bytesPerRow * image.height)
        var outBuffer = vImage_Buffer(data: outData, height: height, width: width, rowBytes: rowBytes)
        
        let _ = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: outBuffer.data, width: Int(outBuffer.width), height: Int(outBuffer.height), bitsPerComponent: 8, bytesPerRow: outBuffer.rowBytes, space: colorSpace, bitmapInfo: image.bitmapInfo.rawValue)!
        let imageRef = context.makeImage()!
        
        free(outData)
        
        return UIImage(cgImage: imageRef)
    }
}


extension UIImage {
    
    public static func fetch(from url: URL, completionHandler: @escaping (URL, UIImage) -> (), cache: NSCache<NSURL, UIImage>?) {
        if let cachedImage = cache?.object(forKey: url as NSURL) {
            completionHandler(url, cachedImage)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let downloadThumbnailTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                
                if let e = error {
                    print("\(UIImage.self).fetch(from:): Error downloading picture from \(url) -> \(e)")
                }
                
                if let imageData = data, let thumbnail = UIImage(data: imageData) {
                    cache?.setObject(thumbnail, forKey: url as NSURL)
                    completionHandler(url, thumbnail)
                }
            }
            
            downloadThumbnailTask.resume()
        }
    }
}

extension UIImage {
    
    public func resized(to newSize: CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero
        let aspectRatio = max(newSize.width / self.size.width, newSize.height / self.size.height)
        
        scaledImageRect.size.width = self.size.width * aspectRatio
        scaledImageRect.size.height = self.size.height * aspectRatio
        scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0
        scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0
        
        return UIImage.serialQueue.sync {
            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
            defer { UIGraphicsEndImageContext() }
            UIGraphicsGetCurrentContext()?.interpolationQuality = .high
            self.draw(in: scaledImageRect)
            return UIGraphicsGetImageFromCurrentImageContext()!
        }
    }
}

extension UIImage {
    
    public func with(alpha: CGFloat) -> UIImage {
        return UIImage.serialQueue.sync {
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            defer { UIGraphicsEndImageContext() }
            self.draw(at: .zero, blendMode: .normal, alpha: alpha)
            return UIGraphicsGetImageFromCurrentImageContext()!
        }
    }
}


extension UIImage {
    public func colorize(with color: UIColor) -> UIImage {
        return UIImage.serialQueue.sync {
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            defer { UIGraphicsEndImageContext() }
            let context = UIGraphicsGetCurrentContext()!
            let area = CGRect(origin: CGPoint.zero, size: self.size)
            
            context.scaleBy(x: 1, y: -1)
            context.translateBy(x: 0, y: -area.size.height)
            context.saveGState()
            context.clip(to: area, mask: cgImage!)
            
            color.set()
            
            context.fill(area)
            context.restoreGState()
            context.setBlendMode(.multiply)
            context.draw(self.cgImage!, in: area)
            
            return UIGraphicsGetImageFromCurrentImageContext()!
        }
    }
}

extension UIImage {
    
    public func scaledAndCropped(for rect: CGRect) -> UIImage {
        return UIImage.serialQueue.sync {
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            defer { UIGraphicsEndImageContext() }
            let context = UIGraphicsGetCurrentContext()!
            context.beginPath()
            context.addArc(
                center: CGPoint(x: rect.width/2, y: rect.height/2),
                radius: rect.width / 2,
                startAngle: 0,
                endAngle: 2*CGFloat.pi,
                clockwise: false)
            context.closePath()
            context.clip()
            
            context.scaleBy(x: rect.width / self.size.width, y: rect.height / self.size.height)
            
            self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))
            
            return UIGraphicsGetImageFromCurrentImageContext()!
        }
    }
}

extension UIImage {
    convenience public init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        var image: UIImage?
        UIImage.serialQueue.sync {
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            color.setFill()
            UIRectFill(rect)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
