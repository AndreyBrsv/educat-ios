
import UIKit

class ProfileConfiguratorImpl: ProfileConfigurator {
    
    func configure(vc viewController: ProfileViewController) {
        
        viewController.presenter = ProfilePresenterImpl(view: viewController)
        
    }
    
}
