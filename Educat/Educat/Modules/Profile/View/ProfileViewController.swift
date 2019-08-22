
import UIKit

/// Контроллер представления, отражающий профиль пользователя
public class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    
    // MARK: Viper
    var presenter: ProfilePresenter!
    let configurator: ProfileConfigurator = ProfileConfiguratorImpl()
    
    // MARK: UI
    var profileTableView = UITableView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Viper -> viewDidLoad()
        configurator.configure(vc: self) // Конфигуратор проставит все зависимости
        presenter.configureView()
        
        // MARK: - profileTableView -> viewDidLoad()
        self.view.addSubview(profileTableView)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(ProfileInformationTableViewCell.self, forCellReuseIdentifier: "info")
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: - self -> viewWillAppear()
        self.view.backgroundColor = .white
        
        // MARK: - profileTableView -> viewWillAppear()
        profileTableView.separatorColor = .educatLightGray
        profileTableView.backgroundColor = .white
        
        // MARK: - navigationBar -> viewWillAppear()
        self.makeNavigationBarClear(withHeaderColor: .educatDarkBlue)
        self.title = "Профиль"
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(imageLiteralResourceName: "settingsProfile") ,
                            style: .done,
                            target: self,
                            action: #selector(settingsNavigationBarButtonAction(sender:)))
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // 
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.profileTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.profileTableView.topAnchor.constraint(equalTo: self.navigationController!.navigationBar.bottomAnchor),
            self.profileTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.profileTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

// MARK: Actions
extension ProfileViewController {
    
    @objc private func settingsNavigationBarButtonAction(sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
}

// MARK: UITableViewDelegate & UITableViewDataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.view.frame.height * 0.4
        }
        return CGFloat(0.0)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Две секции: Информация о пользователе и все остальное
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // Секция с информацией о профиле
        }
        return 4 // Все остальное
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let profileInfoCell = tableView.dequeueReusableCell(withIdentifier: "info") as! ProfileInformationTableViewCell
            profileInfoCell.user = presenter.getCurrentUser()
            profileInfoCell.delegate = self
            profileInfoCell.profileImage = UIImage(imageLiteralResourceName: "ph")
            return profileInfoCell
        }
        return UITableViewCell()
    }
}

// MARK: ProfileInformationTableViewCellDelegate
extension ProfileViewController: ProfileInformationTableViewCellDelegate {
    
    public func editInfo(_ sender: UIButton) {
        print("edit info button tapped")
        let tb = self.tabBarController as! ECTabBarController
        tb.edTabBar.showNotification(withMessage: "Соединение потеряно", textColor: .white, backgroundColor: .educatRed)
//        let card = CardViewController()
//        card.transitioningDelegate = card
//        card.modalPresentationStyle = .custom
//        tabBarController?.modalPresentationStyle = .custom
//        self.tabBarController?.present(card, animated: true, completion: nil)
    }
}
