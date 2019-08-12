import UIKit

public class ECTabBarController: UITabBarController {
    
    open var edTabBar = ECTabBar()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(edTabBar)
        edTabBar.tabBarController = self
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        edTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            edTabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            edTabBar.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: CGFloat(ECTabBarLayoutConstants.tabBarHeightScaleFactor)),
            edTabBar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: CGFloat(ECTabBarLayoutConstants.tabBarWidthScaleFactor)),
            edTabBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
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

    override public func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        print("Attention! ECTabBarController overrides setViewControllers method. \n" +
            "For correct execution, yours view controllers must implement ECViewController protocol.")
        viewControllers?.forEach {
                let item = ($0 as? ECViewController)!.ecTabBarItem
                item?.delegate = self.edTabBar
                self.edTabBar.setItems([item!])
        }
    }
}
