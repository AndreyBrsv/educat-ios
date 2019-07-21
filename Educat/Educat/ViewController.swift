
import UIKit

class ViewController: UINavigationController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .educatDarkBlue
        let tvc = UITabBarController()
        tvc.switchTabBar(true)
        
        let profileVc = ProfileViewController()
        let profileDelegate = ProfileViewControllerDelegateImpl()
        profileVc.delegate = profileDelegate
        
        let vcS = [SWViewController(),SWViewController(),SWViewController(),profileVc]
        
        tvc.addViewControllers(vcS, animated: true)
        self.viewControllers = [tvc]
    
    }


}

