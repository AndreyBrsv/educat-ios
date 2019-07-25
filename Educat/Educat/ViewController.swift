
import UIKit

class ViewController: UINavigationController, SWTabBarDelegate {
    
    func getIconForItem(withIndex index: Int) -> UIImage? {
        let icons = [
            UIImage(imageLiteralResourceName: "feedIcon"),
            UIImage(imageLiteralResourceName: "coursesIcon"),
            UIImage(imageLiteralResourceName: "bookmarkIcon"),
            UIImage(imageLiteralResourceName: "profileIcon"),
        ]
        
        if index < icons.count {
            return icons[index]
        }
        
        return nil
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let tvc = UITabBarController()
        tvc.swTabBar.delegate = self
        tvc.switchTabBar(true)
        
        let vcS = [SWViewController(),SWViewController()]
        
        tvc.addViewControllers(vcS, animated: true)
        self.viewControllers = [tvc]
    
    }


}

