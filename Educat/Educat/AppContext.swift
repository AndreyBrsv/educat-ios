
import UIKit

/// Главный контейнер приложения. В реализации данного интерфейса AppContextImpl
/// создаются необходимые представления и проставляются зависимости между модулями
protocol AppContext {
    
    func getRootViewController() -> UIViewController
    
}
