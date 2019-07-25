
import Foundation

// Специальный протокол для передачи обязанностей тому
// классу, который его реализует.
protocol SubscriberViewDelegate {
    
    func subscribe() -> Void
    
    func unsubscribe() -> Void
    
}
