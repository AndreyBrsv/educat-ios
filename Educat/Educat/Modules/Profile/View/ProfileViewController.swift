
import UIKit

public class ProfileViewController: SWViewController, ProfileViewControllerProtocol {
    
    // Viper
    var presenter: ProfilePresenter!
    let configurator: ProfileConfigurator = ProfileConfiguratorImpl()
    
    // UI
    var profilePhoto: CirclePhotoView!
    var changeInfoButton: UIButton!
    var decorativeStripe: UIView!
    var usernameLabel: UILabel!
    var userInfoLabel: UILabel!
    var userMenuTableView: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(vc: self)
        presenter.configureView()
    }
}
