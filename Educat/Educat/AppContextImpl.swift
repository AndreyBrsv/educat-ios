
import UIKit

/// Да-да приходится писать свой аналог контейнера зависимостей
class AppContextImpl: AppContext {
    
    let tabBarViewController = ECTabBarController()
    
    init() {
        // Resolve all dependency and visual issues
        tabBarViewController.switchTabBar = true
    }
    
    func getRootViewController() -> UIViewController {
        return tabBarViewController
    }
    
}
