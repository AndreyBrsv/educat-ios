
import UIKit

/// Магазин курсов
public class CourseMarketViewController: UIViewController {
    
    // MARK: - Viper
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- self -> viewDidLoad()
        
        // MARK:- navigation bar -> viewDidLoad()
        self.makeNavigationBarClear(withHeaderColor: .white)
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK:- self -> viewWillAppear()
        CAGradientLayer.gradient(.lightBlueVioletBlue, forView: self.view, direction: .principalDiagonal)
        
        // MARK:- navigation bar -> viewWillAppear()
        self.navigationItem.title = "Курсы"
        self.navigationItem.rightBarButtonItem =
        UIBarButtonItem(image: UIImage(imageLiteralResourceName: "options") ,
                        style: .done,
                        target: self,
                        action: nil)
        self.navigationItem.leftBarButtonItem =
        UIBarButtonItem(image: UIImage(imageLiteralResourceName: "search") ,
                        style: .done,
                        target: self,
                        action: nil)
    }
    
}
