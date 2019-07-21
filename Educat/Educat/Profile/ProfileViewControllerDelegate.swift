
import UIKit


protocol ProfileViewControllerDelegate: UITableViewDelegate, UITableViewDataSource {
    
    func getUserName() -> String
    func getUserInformation() -> String
    func getControllerTitle() -> String
    
}
