import UIKit

public class ECTabBarController: UITabBarController {
    
    open var edTabBar: ECTabBar?

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if switchTabBar {
            self.view.addSubview(edTabBar!)
            self.edTabBar?.tabBarController = self
            self.edTabBar?.configureTabBarConstraints()
        }
    }
}

/// Расширение для управления кастомным tabBar
extension ECTabBarController {

    open var switchTabBar: Bool {
        get {
            return self.tabBar.isHidden
        }
        set { // Идея не выделять память, если флаг не true
            if newValue {
                if edTabBar == nil {
                    edTabBar = ECTabBar()
                }
            } else {
                if edTabBar != nil {
                    switchTB(newValue)
                }
            }
        }
    }
    
    private func switchTB(_ newValue: Bool) -> Void {
        self.tabBar.isHidden = newValue
        self.edTabBar!.isHidden = !newValue
    }
    
    override public func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        print("Attention! ECTabBarController overrides setViewControllers method. \n" +
            "For correct execution, yours view controllers must implement ECViewController protocol.")
        super.setViewControllers(viewControllers, animated: animated)
        viewControllers?.forEach {
            self.edTabBar?.setItems([($0 as? ECViewController)!.ecTabBarItem])
        }
    }
}
