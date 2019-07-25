
import UIKit

public class ProfilePresenterImpl: ProfilePresenter {

    var interactor: ProfileInteractor?
    public var router: ProfileRouter = ProfileRouterImpl()
    
    required init(view: ProfileViewControllerProtocol) {

    }

    public func configureView() {
        
    }
    
}
