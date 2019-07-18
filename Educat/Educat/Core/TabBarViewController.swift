
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 10-12 нужно выносить в отдельный метод
        self.view.addSubview(swTabBar)
        swTabBar.configureTabBarConstraints()
        swTabBar.tabBarController = self
        
        switchTabBar(true)
        let vc1 = ViewController()
        vc1.view.backgroundColor = .educatLightGray
        let vc2 = ViewController()
        vc2.view.backgroundColor = .educatDarkYellow
        let vc3 = ViewController()
        vc3.view.backgroundColor = .educatCorall
        let vc4 = ViewController()
        vc4.view.backgroundColor = .educatDarkBlue
        
        self.addViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
        swTabBar.selectorColor = .educatCorall
        
    }
    

}
