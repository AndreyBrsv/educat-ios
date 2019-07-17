
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(swTabBar)
        swTabBar.configureTabBarConstraints()
        
        
        changeTabBar(true)
        
        self.view.layer.insertSublayer(CAGradientLayer.gradient(.yellowCorall, forView: self.view), at: 0)
        
        self.swTabBar.setItems([SWTabBarItem(), SWTabBarItem(), SWTabBarItem(), SWTabBarItem()])
        
    }
    

}
