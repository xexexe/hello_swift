//
//  ViewController.swift
//  AVAssetReader
//
//  Created by Mark Ran on 2017/10/10.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit
import AVFoundation
import CoreGraphics

class ViewController: UIViewController {
    
    var reader: AVAssetReader? = nil
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let path = Bundle.main.path(forResource: "hehe", ofType: "mp4") {
            let url = URL.init(fileURLWithPath: path)
            let asset  = AVAsset.init(url: url)
            reader = try?AVAssetReader.init(asset: asset)
            
            let track = asset.tracks(withMediaType: AVMediaTypeVideo)
            let videoTrack = track[0]
            var options = [String: Any]()
            options[kCVPixelBufferPixelFormatTypeKey as String] = kCVPixelFormatType_32BGRA
            let videoReaderOutput = AVAssetReaderTrackOutput.init(track: videoTrack, outputSettings: options)
            
            reader?.add(videoReaderOutput)
            reader?.startReading()
            
            if let videoBuffer = videoReaderOutput.copyNextSampleBuffer() {
                print(videoBuffer)
                
                if let imagecg = imageFromSampleBufferRef(sampleBufferRef: videoBuffer) {
                    imageView.image = UIImage.init(cgImage: imagecg)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageFromSampleBufferRef(sampleBufferRef: CMSampleBuffer) -> CGImage? {
        var quartzImage: CGImage?
        let buffer = CMSampleBufferGetImageBuffer(sampleBufferRef)
        if let imageBuffer = buffer {
            CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: 0))
            
//            var bufPointer: UnsafeMutableRawPointer?
//            if let baseAddress = CVPixelBufferGetBaseAddress(imageBuffer) {
//                bufPointer = baseAddress.assumingMemoryBound(to: <#T##T.Type#>)
//                // `buf` is `UnsafeMutablePointer<UInt8>`
//            } else {
//                // `baseAddress` is `nil`
//            }
            var baseAddress = CVPixelBufferGetBaseAddress(imageBuffer)
            let bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer)
            let width = CVPixelBufferGetWidth(imageBuffer)
            let height = CVPixelBufferGetHeight(imageBuffer)
            
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let context = CGContext(data: &baseAddress,
                                    width: width,
                                    height: height,
                                    bitsPerComponent: 8,
                                    bytesPerRow: bytesPerRow,
                                    space: colorSpace,
                                    bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue|CGBitmapInfo.byteOrder32Little.rawValue)
            
            if let c = context {
                 quartzImage = c.makeImage()
            }
            
            CVPixelBufferUnlockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: 0))
        }
        
        return quartzImage
    }

    // AVFoundation 捕捉视频帧，很多时候都需要把某一帧转换成 image
//    + (CGImageRef)imageFromSampleBufferRef:(CMSampleBufferRef)sampleBufferRef
//    {
//    // 为媒体数据设置一个CMSampleBufferRef
//    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBufferRef);
//    // 锁定 pixel buffer 的基地址
//    CVPixelBufferLockBaseAddress(imageBuffer, 0);
//    // 得到 pixel buffer 的基地址
//    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
//    // 得到 pixel buffer 的行字节数
//    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
//    // 得到 pixel buffer 的宽和高
//    size_t width = CVPixelBufferGetWidth(imageBuffer);
//    size_t height = CVPixelBufferGetHeight(imageBuffer);
//    
//    // 创建一个依赖于设备的 RGB 颜色空间
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    
//    // 用抽样缓存的数据创建一个位图格式的图形上下文（graphic context）对象
//    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
//    //根据这个位图 context 中的像素创建一个 Quartz image 对象
//    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
//    // 解锁 pixel buffer
//    CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
//    
//    // 释放 context 和颜色空间
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSpace);
//    // 用 Quzetz image 创建一个 UIImage 对象
//    // UIImage *image = [UIImage imageWithCGImage:quartzImage];
//    
//    // 释放 Quartz image 对象
//    //    CGImageRelease(quartzImage);
//    
//    return quartzImage;
//    
//    }
}

