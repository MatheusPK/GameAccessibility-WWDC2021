//
//  FaceTrackingView.swift
//  BookCore
//
//  Created by Matheus Kulick on 09/04/21.
//

import Foundation
import ARKit
import SwiftUI
import AVFoundation

class FaceTrackingView: UIViewController, ARSessionDelegate {
    
    var arViewDelegate: GameDelegate!
    var arView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arView = ARSCNView()
        self.arView.session.delegate = self
        self.view = arView
        self.viewWillAppear(true)
        self.view.frame.size = CGSize(width: 200, height: 200)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard ARFaceTrackingConfiguration.isSupported else {print("iPhone X required"); return}
        
        let configuration = ARFaceTrackingConfiguration()
        
        self.arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.arView.session.pause()
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        // -> roda quando uma anchor atualiza
        if let faceAnchor = anchors.first as? ARFaceAnchor {
            update(withFaceAnchor: faceAnchor)
        }
    }
    
    func update(withFaceAnchor faceAnchor: ARFaceAnchor) {
        guard let eyeR = faceAnchor.blendShapes[.eyeBlinkLeft] as? Float else {return}
        guard let eyeL = faceAnchor.blendShapes[.eyeBlinkRight] as? Float else {return}
        guard let mouthPk = faceAnchor.blendShapes[.mouthPucker] as? Float else {return}
        guard let tongueOut = faceAnchor.blendShapes[.tongueOut] as? Float else {return}
        //        guard let smileR = faceAnchor.blendShapes[.mouthSmileLeft] as? Float else {return}
        //        guard let smileL = faceAnchor.blendShapes[.mouthSmileRight] as? Float else {return}
        
        
        
        if mouthPk > 0.4 {
            arViewDelegate.setTexture(expressionT: .frontMouthPucker)
        }
        if eyeL > 0.8 {
            arViewDelegate.setTexture(expressionT: .frontEyeBlinkLeft)
        }
        if eyeR > 0.8 {
            arViewDelegate.setTexture(expressionT: .frontEyeBlinkRight)
        }
        if tongueOut > 0.4 {
            arViewDelegate.setTexture(expressionT: .frontTongueOut)
        }
        
        if(mouthPk <= 0.4 && eyeL <= 0.8 && eyeR <= 0.8 && tongueOut <= 0.4) {
            
            arViewDelegate.setTexture(expressionT: .frontIdle)
        }
        
    }
}

//public func getDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
//        let devices: NSArray = AVCaptureDevice.devices() as NSArray;
//        for de in devices {
//            let deviceConverted = de as! AVCaptureDevice
//            if(deviceConverted.position == position){
//                return deviceConverted
//            }
//        }
//        return nil
//    }


