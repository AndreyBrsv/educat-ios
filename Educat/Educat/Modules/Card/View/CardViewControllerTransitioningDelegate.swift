
import UIKit

/// Делегат перехода от любого ViewController к карточке
/// Скрытие карточки управляется методами UIViewProperyAnimation
/// Однако для управления методами жизненного цикла контроллера
/// представления необходимо наличие делегата перехода
class CardViewControllerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CardViewControllerAnimatedTransitioning()
    }
    
    
}
