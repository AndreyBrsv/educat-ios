
import UIKit

class CardViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    static let animationTransitionDuration = 2.0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return CardViewControllerAnimatedTransitioning.animationTransitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
}
