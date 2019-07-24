
import UIKit

class ProfileViewControllerDelegateImpl: UIViewController, ProfileViewControllerDelegate {
    
    let profileMenuNames = ["Настройки", "Профиль", "Написать разработчикам", "Стать сотрудником"]
    let images = [
        UIImage(imageLiteralResourceName: "settingsProfile"),
        UIImage(imageLiteralResourceName: "profile"),
        UIImage(imageLiteralResourceName: "askProfile")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getControllerTitle() -> String {
        return "Профиль"
    }
    
    func getUserName() -> String {
        return "    " + "Илья Михеев" + "    "
    }
    
    func getUserInformation() -> String {
        return "Учусь в 11 классе :)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileMenuNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell") as! ProfileTableViewCell
        cell.cellTitle.text = profileMenuNames[indexPath.row]
        cell.cellTitle.textColor = .educatDarkBlue
        cell.cellTitle.font = UIFont(name: "AvenirNext-Regular", size: CGFloat(17))
        if indexPath.row < images.count {
            cell.cellImage.image = images[indexPath.row]
        }
        return cell
    }
    
    
}
