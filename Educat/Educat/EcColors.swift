
import UIKit

// Расширение для генерации необходимых градиентов оформления
extension CAGradientLayer {

    // Вспомогательный enum - сюда забиваем цвета для
    // создания темы
    public enum EcGradient {
        case pinkOrage
    }
    
    public static func gradient(_ gradient: EcGradient, forView view: UIView) -> CAGradientLayer {
        let grad = CAGradientLayer()
        grad.frame = view.bounds
        var cgColorsArray: [CGColor] = []
        switch gradient {
        case .pinkOrage:
            // Сюда добавляем необходимые цвета
            cgColorsArray.append(UIColor.purple.cgColor)
            break
        default:
            cgColorsArray.append(UIColor.white.cgColor)
        }
        grad.colors = cgColorsArray
        return grad
    }
    
}
