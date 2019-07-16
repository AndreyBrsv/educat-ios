
import UIKit

class TabBarViewController: UITabBarController {
    
    var educatTabBar: EducatTabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.educatTabBar = EducatTabBar()
        
    }
    
    public func replaceTabBar(_ flag: Bool) -> Void {
        if flag {
            self.tabBar.isHidden = !self.tabBar.isHidden
            self.educatTabBar.isHidden = !self.educatTabBar.isHidden
        }
    }

}
