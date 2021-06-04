//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  A source file which is part of the auxiliary module named "BookCore".
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(BookCore_LiveViewController3)
public class LiveViewController3: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    var gameScene: GameScene3!
    var faceTrackingView: FaceTrackingView2!
    
    fileprivate func addConstraint() {
        faceTrackingView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faceTrackingView.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            faceTrackingView.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            faceTrackingView.view.widthAnchor.constraint(equalToConstant: 100),
            faceTrackingView.view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        
        self.view = sceneView
        view.backgroundColor = .white
        
        
        faceTrackingView = FaceTrackingView2()

        
        if let view = self.view as! SKView? {
            gameScene = GameScene3(size: self.view.frame.size)
            view.presentScene(gameScene)
            view.ignoresSiblingOrder = true
            //view.showsFPS = true
            //view.showsNodeCount = true
            //view.showsPhysics = true
            self.view = view
            
            faceTrackingView.arViewDelegate = gameScene
            view.addSubview(faceTrackingView.view)
            
            addConstraint()
        }
    }
    /*
    public func liveViewMessageConnectionOpened() {
        // Implement this method to be notified when the live view message connection is opened.
        // The connection will be opened when the process running Contents.swift starts running and listening for messages.
    }
    */

    /*
    public func liveViewMessageConnectionClosed() {
        // Implement this method to be notified when the live view message connection is closed.
        // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
        // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
    }
    */

    public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
        switch message {
            case let .integer(info):
                gameScene.eggCount = info
                gameScene.resetScene()
                gameScene.addEggs()
                gameScene.backgroundSound.run(SKAction.play())
                
            default:
                print("mensagem nao tratada")
            }
    }
}
