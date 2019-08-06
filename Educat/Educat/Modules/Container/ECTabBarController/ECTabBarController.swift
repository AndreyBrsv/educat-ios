import UIKit

public class ECTabBarController: UITabBarController {

    open var edTabBar = ECTabBar()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupECTabBarController()
    }

    private func setupECTabBarController() -> Void {
        self.view.addSubview(edTabBar)
        self.edTabBar.tabBarController = self
        self.edTabBar.configureTabBarConstraints()
    }

}

/// Расширение для управления кастомным tabBar
extension ECTabBarController {

    open var switchTabBar: Bool {
        get {
            return self.tabBar.isHidden
        }
        set {
            self.tabBar.isHidden = newValue
            self.edTabBar.isHidden = !newValue
        }
    }

    /// Позволяет добавлять к TabBarController другие контроллеры, добавляя при этом кнопки в SWTabBar
    open func addViewControllers<T>(_ viewControllers: [T]?, animated: Bool) where T:ECViewController {
        self.setViewControllers((viewControllers as! [UIViewController]), animated: animated)
        var items: [ECTabBarItem] = []
        viewControllers?.forEach {
            items.append($0.ecTabBarItem)
        }
        self.edTabBar.setItems(items)
    }
    
}
