
import UIKit

class CardViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    let transitionDuration = 0.6
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from) as? ECTabBarController
        let toVC = transitionContext.viewController(forKey: .to) as! CardViewController
        
        let toView = transitionContext.view(forKey: .to)!
        
        transitionContext.containerView.addSubview(toView)
        
        // MARK:- Настройка разметки для карточки
        toView.translatesAutoresizingMaskIntoConstraints = false
        let height = toView.frame.height
        // Будем анимировать постоянную верхнего constraint
        // MARK:-TODO: Сделать для горизонтального режима тоже
        let topConstraint = toView.topAnchor.constraint(equalTo: transitionContext.containerView.topAnchor, constant: height)
        NSLayoutConstraint.activate([
            topConstraint,
            toView.leadingAnchor.constraint(equalTo: transitionContext.containerView.leadingAnchor),
            toView.trailingAnchor.constraint(equalTo: transitionContext.containerView.trailingAnchor),
            toView.bottomAnchor.constraint(equalTo: transitionContext.containerView.bottomAnchor),
        ])
        transitionContext.containerView.layoutIfNeeded()
        
        topConstraint.constant = CardViewController.CardLayoutConstants.topSafeAreaAnchorConstraintConstant
        UIViewPropertyAnimator.init(duration: transitionDuration, dampingRatio: 1.0) {
            toVC.cornerRadius = 20.0
            transitionContext.containerView.layoutIfNeeded()
        }.startAnimation()
        
        toVC.state = .expanded
        
        transitionContext.completeTransition(true)
    }
    
    
    
    
}
