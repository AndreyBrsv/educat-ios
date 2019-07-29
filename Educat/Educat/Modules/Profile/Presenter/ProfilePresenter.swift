
import Foundation

public protocol ProfilePresenter {
    
    var router: ProfileRouter { get set }

    /// Метод, конфигурирующий слой view (ProfileViewController)
    func configureView()
    
}
