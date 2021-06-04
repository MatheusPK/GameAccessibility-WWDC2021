//
//  FaceTrackingView.swift
//  BookCore
//
//  Created by Matheus Kulick on 09/04/21.
//

import Foundation
import ARKit
import SwiftUI

class FaceTrackingView2: UIViewController, ARSessionDelegate {
    
    var arViewDelegate: GameDelegate2!
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
            arViewDelegate.setMoveTexture(move: .up)
        }
        if eyeL > 0.7 {
            arViewDelegate.setMoveTexture(move: .left)
        }
        if eyeR > 0.7 {
            arViewDelegate.setMoveTexture(move: .right)
        }
        if tongueOut > 0.4 {
            arViewDelegate.setMoveTexture(move: .down)
        }
        
        if(mouthPk <= 0.4 && eyeL <= 0.7 && eyeR <= 0.7 && tongueOut <= 0.4) {
            
            arViewDelegate.setMoveTexture(move: .idle)
        }
        
    }
}
