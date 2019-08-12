
import UIKit

class SettingsViewController: UIViewController {
    
    var settingsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingsTableView.delegate = self
        self.settingsTableView.dataSource = self
        self.view.addSubview(settingsTableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .white
        self.settingsTableView.backgroundColor = .white
        self.navigationItem.title = "Настройки"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        guard let ncb = self.navigationController?.navigationBar else {
            return
        }

        settingsTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            settingsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            settingsTableView.topAnchor.constraint(equalTo: ncb.bottomAnchor),
        ])
    }
}

// MARK: UITableViewDelegate & UITableViewDataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
