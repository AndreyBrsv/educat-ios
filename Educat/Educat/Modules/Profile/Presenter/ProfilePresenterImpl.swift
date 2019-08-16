
import Foundation

public class ProfilePresenterImpl: ProfilePresenter {

    var interactor: ProfileInteractor?
    public var router: ProfileRouter = ProfileRouterImpl()
    
    required init(view: ProfileViewControllerProtocol) {
        
    }

    public func configureView() {
        
    }
    
    public func getCurrentUser() -> User {
        return User(id: 12, firstName: "Кот", lastName: "Обормот", userInfo: "Преподаватель кафедры машинного обучения МГУ 8)")
    }
    
}
