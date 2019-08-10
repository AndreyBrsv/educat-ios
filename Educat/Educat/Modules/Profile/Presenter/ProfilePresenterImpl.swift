
import Foundation

public class ProfilePresenterImpl: ProfilePresenter {

    var interactor: ProfileInteractor?
    public var router: ProfileRouter = ProfileRouterImpl()
    
    required init(view: ProfileViewControllerProtocol) {
        
    }

    public func configureView() {
        
    }
    
    public func getCurrentUser() -> User {
        return User(firstName: "Илья", lastName: "Михеев", userInfo: "Учусь в 11 классе")
    }
    
}
