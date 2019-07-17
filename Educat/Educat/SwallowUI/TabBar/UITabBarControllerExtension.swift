
import UIKit

/// Расширение, добавляющее swTabBar к системному UITabBarController
extension UITabBarController {
    private struct SWTabBarStruct {
        static var swTabBar = SWTabBar(frame: CGRect.zero)
    }
    var swTabBar: SWTabBar {
        get {
            return SWTabBarStruct.swTabBar
        }
    }
    /// Позволяет скрыть встроенный tabBar и показывать SWTabBar
    public func changeTabBar(_ flag: Bool) {
        self.tabBar.isHidden = flag
        self.swTabBar.isHidden = !flag
    }
    /// Позволяет добавлять к TabBarController другие контроллеры, добавляя при этом кнопки в SWTabBar
    public func addViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        self.setViewControllers(viewControllers, animated: animated)
        if let vcS = viewControllers {
            vcS.forEach {self.swTabBar.setItems([$0.swTabBarItem])}
        }
    }
}
