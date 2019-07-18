
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(swTabBar)
        swTabBar.configureTabBarConstraints()
        
        
        switchTabBar(true)
        
        self.addViewControllers([ViewController(), ViewController(), ViewController(), ViewController()], animated: true)
        
        swTabBar.selectorColor = .educatCorall
        
    }
    

}
