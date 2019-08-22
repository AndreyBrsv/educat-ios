import UIKit

public class ECTabBarController: UITabBarController {
    
    open var edTabBar = ECTabBar()
    
    // MARK:- ecTabBar constraints
    open var bottomConstraint: NSLayoutConstraint?
    open var topConstraint: NSLayoutConstraint?

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- ecTabBar -> viewDidLoad()
        self.view.addSubview(edTabBar)
        edTabBar.tabBarController = self
        
        // MARK:- ecTabBar constraitns -> viewDidLoad()
        edTabBar.translatesAutoresizingMaskIntoConstraints = false
        bottomConstraint = edTabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        topConstraint = edTabBar.topAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([
            bottomConstraint!,
            edTabBar.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: CGFloat(ECTabBarLayoutConstants.tabBarHeightScaleFactor)),
            edTabBar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: CGFloat(ECTabBarLayoutConstants.tabBarWidthScaleFactor)),
            edTabBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
}


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
        
        for i in 0..<edTabBar.items.count {
            edTabBar.items[i].setImage(edTabBar.delegate?.getItemImage(withIndex: i), for: .normal)
        }
    }
    
    public func hide(_ flag: Bool, animate: Bool = true) {
        if flag {
            bottomConstraint?.isActive = false
            topConstraint?.isActive = true
        } else {
            bottomConstraint?.isActive = true
            topConstraint?.isActive = false
        }
        view.layoutIfNeeded()
    }
}
