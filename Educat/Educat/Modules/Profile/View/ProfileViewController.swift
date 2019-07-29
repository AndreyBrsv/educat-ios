
import UIKit

/// Контроллер представления, отражающий профиль пользователя
public class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    
    // Viper
    var presenter: ProfilePresenter!
    let configurator: ProfileConfigurator = ProfileConfiguratorImpl()
    
    // UI
    var profileTableView: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(vc: self) // Конфигуратор проставит все зависимости
        presenter.configureView()
        setupProfileView()
    }

    public func setUsername(_ username : String) -> Void {

    }

    private func setupProfileView() -> Void {

        self.profileTableView.translatesAutoresizingMaskIntoConstraints = false

        let constraint = [
            // Ограничения для profileTableView
            self.profileTableView.centerXAnchor.constraint(equalTo: self.view!.centerXAnchor),
            self.profileTableView.centerYAnchor.constraint(equalTo: self.view!.centerYAnchor),
            self.profileTableView.heightAnchor.constraint(equalTo: self.view!.heightAnchor),
            self.profileTableView.widthAnchor.constraint(equalTo: self.view!.widthAnchor),
        ]

        NSLayoutConstraint.activate(constraint)

    }
}

/// Расширение для обеспечения profileTableView необходимыми данными
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
