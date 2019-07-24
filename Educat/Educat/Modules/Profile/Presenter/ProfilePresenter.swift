
import UIKit

public protocol ProfilePresenter {
    
    var router: ProfileRouter { get set }
    
    func configureView()
    
}
