//
//  CameraPreview.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import UIKit
import AVFoundation

final class CameraPreview: UIView {
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    var previewLayer: AVCaptureVideoPreviewLayer {
        layer as! AVCaptureVideoPreviewLayer
    }
}
