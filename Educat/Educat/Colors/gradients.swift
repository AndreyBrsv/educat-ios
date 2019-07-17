
import UIKit

// Расширение для генерации необходимых градиентов оформления
extension CAGradientLayer {

    // Вспомогательный enum - сюда забиваем цвета для
    // создания темы
    public enum CAGradient {
        case yellowCorall
        case lightBlueDarkBlue
    }
    
    // enum для определения направления градиента
    public enum CAGradientDirection {
        
    }
    
    open class func gradient(_ gradient: CAGradient, forView view: UIView) -> CAGradientLayer {
        let grad = CAGradientLayer()
        grad.frame = view.bounds
        var cgColorsArray: [CGColor] = []
        switch gradient {
        case .yellowCorall:
            // Сюда добавляем необходимые цвета
            cgColorsArray.append(UIColor.educatLightYellow.cgColor)
            cgColorsArray.append(UIColor.educatCorall.cgColor)
            break
        default:
            cgColorsArray.append(UIColor.white.cgColor)
        }
        grad.colors = cgColorsArray
        return grad
    }
    
}
