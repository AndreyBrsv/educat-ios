
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(swTabBar)
        swTabBar.configureTabBarConstraints()
        
        
        changeTabBar(true)
        
        print(swTabBar.items)
        
    }
    

}
