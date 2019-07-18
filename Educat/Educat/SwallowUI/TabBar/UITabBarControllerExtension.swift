
import UIKit

/// Расширение, добавляющее swTabBar к системному UITabBarController
extension UITabBarController: SWTabBarDelegate {
    
    private struct SWTabBarStruct {
        static var swTabBar = SWTabBar(frame: CGRect.zero)
    }
    
    var swTabBar: SWTabBar {
        get {
            return SWTabBarStruct.swTabBar
        }
    }
    
    /// Позволяет скрыть встроенный tabBar и показывать SWTabBar
    public func switchTabBar(_ flag: Bool) {
        self.tabBar.isHidden = flag
        self.swTabBar.isHidden = !flag
    }
    /// Позволяет добавлять к TabBarController другие контроллеры, добавляя при этом кнопки в SWTabBar
    /// На данный момент требуется в качестве массива передавать [SWViewController]
    public func addViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        self.setViewControllers(viewControllers, animated: animated)
        if let vcS = viewControllers {
            var items: [SWTabBarItem] = []
            vcS.forEach {items.append(($0 as! SWViewController).swTabBarItem)}
            self.swTabBar.setItems(items)
        }
    }
}
