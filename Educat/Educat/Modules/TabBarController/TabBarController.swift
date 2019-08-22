
import UIKit

class TabBarController: ECTabBarController {
    
    var card: CardViewController!
    
    private let tabBarItemsImages = [ // Перенести в постовщик Presenter
        UIImage(imageLiteralResourceName: "feedIcon"),
        UIImage(imageLiteralResourceName: "coursesIcon"),
        UIImage(imageLiteralResourceName: "bookmarkIcon"),
        UIImage(imageLiteralResourceName: "profileIcon"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edTabBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CAGradientLayer.gradient(.yellowCorall, forView: edTabBar.selector, direction: .leftRight)
    }
}

//MARK: - Реализация протокола ECTabBarDelegate
extension TabBarController: ECTabBarDelegate {
    
    func getItemImage(withIndex index: Int?) -> UIImage? {
        guard let i = index else { return nil }
        guard i < tabBarItemsImages.count else { return nil }
        return tabBarItemsImages[i]
    }
}
