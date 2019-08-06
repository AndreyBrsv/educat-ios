
import UIKit

class FeedViewController: UIViewController {
    
    var tableView: UITableView!
    
    let tap = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView()
        
        tap.addTarget(self, action: #selector(tab(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    private func configureTableViewConstraints() -> Void {
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
    }
    
    @objc
    func tab(_ gesture: UITapGestureRecognizer) -> Void {
        let tbc = self.tabBarController! as! TabBarController
        tbc.showDetailViewController(tbc.card, sender: nil)
    }
}
