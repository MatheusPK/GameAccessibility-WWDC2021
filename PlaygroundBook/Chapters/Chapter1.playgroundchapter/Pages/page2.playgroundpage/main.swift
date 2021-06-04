//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//

import PlaygroundSupport

let tongueOut = 0
let mouthPucker = 1
let eyeBlinkLeft = 2
let eyeBlinkRight = 3
var faceExpressions:[Int] = []
//#-end-hidden-code

/*:
 # First let's teach Alfredo how to interact with the screen using his face

 * Callout(Interaction 🦖):
    In this game we will use only four facial expressions: **Blink the right eye, blink the left eye, make a kissing face(pucker up) and put out your tongue**.
 
    In the box below, insert one or more facial expressions, so that the alfredo can learn what movements he can make with his face.
 
 - Important:
    Try the four facial expressions available by typing in the box below, remember to separate them by ",".

 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, tongueOut, mouthPucker, eyeBlinkLeft, eyeBlinkRight)
faceExpressions = [/*#-editable-code Enter facial expressions*//*#-end-editable-code*/]

/*:
 **Now run the code, try to make these expressions and see what happens!**
 
When you're done, go to [next page](@next)
 */

//#-hidden-code
//if let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
//    var faceExpressionsPV : [PlaygroundValue] = []
//    for expression in faceExpressions {
//        faceExpressionsPV.append(PlaygroundValue.integer(expression))
//    }
//    let array = PlaygroundValue.array(faceExpressionsPV)
//    proxy.send(array)
//}
public func startSystem() {
    guard let remoteView = PlaygroundPage.current.liveView as?
            PlaygroundRemoteLiveViewProxy else {
            fatalError("Erro")
    }

        var faceExpressionsPV : [PlaygroundValue] = []
        for expression in faceExpressions {
            faceExpressionsPV.append(PlaygroundValue.integer(expression))
        }
        let array = PlaygroundValue.array(faceExpressionsPV)

    remoteView.send(array)
}

startSystem()
//#-end-hidden-code


