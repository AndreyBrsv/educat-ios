
import UIKit

class ForeignProfileViewController: UIViewController, SubscriberViewDelegate, UITableViewDelegate {
    
    var subscriberView: SubscribeView!
    
    var articlesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubscribeView()
        
        articlesTableView = UITableView()
        articlesTableView.delegate = self
        self.view.addSubview(articlesTableView)
        
    }
    
    /// Методы делегата SubscribeView (вызываются тогда, когда мы пытаемся
    /// подписаться/отписаться к/от пользователя)
    func subscribe() -> Void {
        
    }
    
    func unsubscribe() -> Void {
        
    }
    
    /// Методы конфигурации
    func configureSubscribeView() -> Void {
        subscriberView = SubscribeView()
        subscriberView.delegate = self
        self.view.addSubview(subscriberView)
    }
}
