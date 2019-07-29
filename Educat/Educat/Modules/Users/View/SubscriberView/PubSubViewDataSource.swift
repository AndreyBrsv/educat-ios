
import Foundation

public protocol PubSubViewDataSource {
    
    func getPublicationsCount() -> Int
    
    func getSubscribersCount() -> Int
    
}
