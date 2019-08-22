
import UIKit

// MARK: - Прозрачный navigationBar
extension UIViewController {
    
    /// Делает навигационную панель прозрачной с заданным цветом заголовка
    open func makeNavigationBarClear(withHeaderColor color: UIColor?) -> Void {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        let defaultColor = UIColor.black
        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor : color ?? defaultColor]
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : color ?? defaultColor]
    }
}
