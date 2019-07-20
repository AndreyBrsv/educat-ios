
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let s = SubscribeView(publications: "10", subscribers: "20", subscribed: false)
        self.view.addSubview(s)
        s.configureSelf()
    }
    

}
