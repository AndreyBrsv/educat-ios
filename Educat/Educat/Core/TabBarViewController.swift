
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(swTabBar)
        swTabBar.configureTabBarConstraints()
        
        
        switchTabBar(true)
        
        self.view.layer.insertSublayer(CAGradientLayer.gradient(.yellowCorall, forView: self.view), at: 0)
        
        self.addViewControllers([SWViewController(), SWViewController(), SWViewController(), SWViewController()], animated: true)
        
        print("У детей______________*************_______________________")
        (self.children as! [SWViewController]).forEach {print($0.swTabBarItem)}
        print("У бара______________*************_______________________")
        self.swTabBar.items.forEach {print($0)}
        print("У детей______________*************_______________________")
        (self.children as! [SWViewController]).forEach {print($0.swTabBarItem)}
        
    }
    

}
