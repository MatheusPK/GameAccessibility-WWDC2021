//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
import PlaygroundSupport
var numberOfEggs = 5
//#-end-hidden-code

/*:
 # Now that we've seen how to interact with the screen using facial expressions, let's play!!
 * Callout(The game 🥚):
    While Alfredo was sound asleep, his baby dinosaur eggs were magically
    transported to his iPad 📲 and they ended up trapped within a game.
    Fortunately, Alfredo has already learned to interact with his iPad using facial expressions.
    Help Alfredo to rescue all his puppies scattered around the map!!
 
  # Gameplay 🕹:
* Callout(controls):
    In this game we have four movements:
 
    ⬅️ move to the left: **Close the left eye**
  
    ➡️ move to the right: **Close the right eye**
  
    ⬆️ move upwards: **Pucker up**
  
    ⬇️ move down: **Put out your tongue**
*/

numberOfEggs = /*#-editable-code number of eggs on the game*/5/*#-end-editable-code*/
/*:
 **Choose the amount of eggs to be generated and then execute the code to rescue the dinosaur eggs!**
 */


//#-hidden-code
public func startSystem() {
    guard let remoteView = PlaygroundPage.current.liveView as?
            PlaygroundRemoteLiveViewProxy else {
            fatalError("Erro")
    }

    remoteView.send(.integer(numberOfEggs))
}
startSystem()
//#-end-hidden-code




 

